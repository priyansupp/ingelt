import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ingelt/data/models/user_grpdata_model.dart';

import '../models/group_model.dart';
import '../models/profile_model.dart';
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



  Future<List<ProfileModel>?> getConnectionsRequestedFrom(String uid) async {
    try {
      List<ProfileModel> requestedFrom = [];
      List<dynamic> requestedFromId = [];
      Map<String, dynamic> map;
      DocumentReference documentReference = FirebaseFirestore.instance.collection('userdata').doc(uid);
      await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
        if(documentSnapshot.exists) {
          map = documentSnapshot.data() as Map<String, dynamic>,
          requestedFromId = map['RequestedFrom'] as List<dynamic>,
        }
      });
      ProfileModel? userModel;
      for(String userId in requestedFromId) {
        print(userId);
        documentReference = FirebaseFirestore.instance.collection('users').doc(userId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            userModel = ProfileModel.fromJson(documentSnapshot.data() as Map<String, dynamic>),
            requestedFrom.add(userModel!),
          }
        });
      }
      // print(previousGroups[0].category);
      // print(requestedToGroups);

      return requestedFrom;
    } on FirebaseException catch(e) {
      if(kDebugMode) {
        print("Failed to fetch requests from users... ${e.code}: ${e.message}");
      }
    }
    catch(e) {
      // return ProfileModel(uid: '', name: '', email: '');
      throw Exception(e.toString());
    }
    return null;
  }



  Future<List<GroupModel>?> getSpecificGroups(String uid) async {
    try {
      List<GroupModel> specificGroups = [];
      List<String> specificGroupsId = [];
      List<dynamic> connectionId = [];
      Map<String, dynamic> map;

      // first getting all the connections of the currentUser.
      DocumentReference documentReference = FirebaseFirestore.instance.collection('userdata').doc(uid);
      await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
        if(documentSnapshot.exists) {
          map = documentSnapshot.data() as Map<String, dynamic>,
          connectionId = map['Connections'] as List<dynamic>,
        }
      });

      // checking if a particular connection has created any group or not, i.e if he has any adminGrpId.
      for(String userId in connectionId) {
        // print("hellp" + userId);
        String? adminGrpId;
        documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(userId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            map = documentSnapshot.data() as Map<String, dynamic>,
            adminGrpId = map['AdminGrpId'],
          }
        });
        if(adminGrpId != null && adminGrpId != "") {
          specificGroupsId.add(adminGrpId!);
        }
      }

      for(String grpId in specificGroupsId) {
        // print("helo" + grpId);
        GroupModel? groupModel;
        documentReference = FirebaseFirestore.instance.collection('groups').doc(grpId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            groupModel = GroupModel.fromJson(documentSnapshot.data() as Map<String, dynamic>),
            specificGroups.add(groupModel!),
          }
        });
      }
      // print(specificGroups[0].category);
      // print(specificGroups.length);

      return specificGroups;
    } on FirebaseException catch(e) {
      if(kDebugMode) {
        print("Failed to fetch requests from users... ${e.code}: ${e.message}");
      }
    }
    catch(e) {
      // return ProfileModel(uid: '', name: '', email: '');
      throw Exception(e.toString());
    }
    return null;
  }



}