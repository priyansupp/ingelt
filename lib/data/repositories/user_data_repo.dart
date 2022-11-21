import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/user_data_model.dart';

class UserDataRepository {
  Future<UserDataModel?> setForte(List<int>? forte) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('userdata').doc(currentUser?.uid);
    documentReference.set({
      'Forte': forte,
    }, SetOptions(merge: true));

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return UserDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<UserDataModel?> setWorking(String? working) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference documentReference = FirebaseFirestore.instance.collection('userdata').doc(currentUser?.uid);
    await documentReference.set({
      'Working': working,
    }, SetOptions(merge: true));
    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return UserDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<UserDataModel?> setConnections(List<String>? connections) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('userdata').doc(currentUser?.uid);
    documentReference.set({
      'Connections': connections,
    }, SetOptions(merge: true));

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return UserDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<UserDataModel?> setRequestedTo(List<String>? requestedTo) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('userdata').doc(currentUser?.uid);
    await documentReference.set({
      'RequestedTo': requestedTo,
    }, SetOptions(merge: true));

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return UserDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<UserDataModel?> setRequestedFrom(List<String>? requestedFrom) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('userdata').doc(currentUser?.uid);
    await documentReference.set({
      'RequestedFrom': requestedFrom,
    }, SetOptions(merge: true));

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return UserDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<UserDataModel?> setFeatured(List<Map<String, String>>? featured) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('userdata').doc(currentUser?.uid);
    await documentReference.set({
      'Featured': featured,
    }, SetOptions(merge: true));

    final DocumentSnapshot documentSnapshot = await documentReference.get();

    return UserDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  }

  Future<UserDataModel?> getUserData(String uid) async {
    try {
      final DocumentReference documentReference = FirebaseFirestore.instance.collection('userdata').doc(uid);
      final documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        // print(documentSnapshot.data());
        return UserDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        // print('could not fetch');
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
}