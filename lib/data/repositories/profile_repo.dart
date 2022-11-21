import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:ingelt/data/models/profile_model.dart';



class ProfileRepository {

  Future<ProfileModel?> saveProfileInfo(String? photoURL, String email, String name, String? phone, String? location, String? website, String? designation, String? university, String? skill, String? company) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);

    // PhotoURL should not get updated.
    final data = {
      'UID': currentUser!.uid,
      'Email': email,
      'Name': name,
      'Phone': phone,
      'Designation': designation,
      'Skill': skill,
      'Website': website,
      'Location': location,
      'University': university,
      'Company': company
    };
    // we pass photoURL = null when we know that photoURL is not even declared in the document, we pass photoURL = "some link" when although declared, we want to update it. we pass photoURL = "", when we don't want to update or declare photoURL in doc.
    if(photoURL != "") {
      data['PhotoURL'] = photoURL;    // therefore add photoURL also
    }

    // setting values in database
    // await documentReference.update(profileModel.toJson());
    await documentReference.set(data, SetOptions(merge: true));
    final documentSnapshot = await documentReference.get();
    return ProfileModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<ProfileModel?> addURL(FilePickerResult result) async {
    String url = await uploadImage(result);
    final currentUser = FirebaseAuth.instance.currentUser!;
    final documentReference = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    final documentSnapshot = await documentReference.get();
    return ProfileModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<String> uploadImage(FilePickerResult result) async {
    // final path = result.files.single.path;
    final fileName = result.files.first.name;
    // print(path);     // complete path of the picked file
    // print(fileName);    // just the name and extension of the picked file.

    final destination = 'user/$fileName';
    PlatformFile pickedFile = result.files.first;
    final file = File(pickedFile.path!);

    final ref = FirebaseStorage.instance.ref().child(destination);
    UploadTask? uploadTask;
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() => {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    final currentUser = FirebaseAuth.instance.currentUser!;

    final documentReference = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    final documentSnapshot = await documentReference.set(
        {
          'PhotoURL': urlDownload
        },
      SetOptions(merge: true)
    );
    return urlDownload;
  }

  Future<ProfileModel?> uploadImageURL(String photoURL) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    final documentReference = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    await documentReference.set(
        {
          'PhotoURL': photoURL
        }, SetOptions(merge: true)
    );
    final documentSnapshot = await documentReference.get();
    return ProfileModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<ProfileModel?> getProfile(String uid) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    try {
      final DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(uid);
      final documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        // print(documentSnapshot.data());
        return ProfileModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        // print('could not fetch');
        // create the user profile
        // await FirebaseFirestore.instance.collection('users').doc(uid).set(
        //     ProfileModel(uid: uid, name: "", designation: null, skill: null, company: null, email: currentUser!.email!, phone: null, photoURL: null, university: null, website: null).toJson()
        // );
        return null;
      }

    } on FirebaseException catch(e) {
      if(kDebugMode) {
        print("Failed to fetch user profile ${e.code}: ${e.message}");
      }
    }
    catch(e) {
      // return ProfileModel(uid: '', name: '', email: '');
      throw Exception(e.toString());
    }
    return null;
  }

  // void removeURL() => emit(ProfileState(photoURL: null, uid: '', name: '', email: ''));

}