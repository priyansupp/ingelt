import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ingelt/data/models/group_model.dart';

import '../models/user_grpdata_model.dart';

class UserGrpDataRepository {
  void setUserAsGroupAdmin(String grpId) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(currentUser?.uid);
    final documentSnapshot = documentReference.set({
      'AdminGrpId': grpId,
    }, SetOptions(merge: true));
  }

  void deleteUserAdminGroup() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(currentUser?.uid);
    await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
      if(documentSnapshot.exists) {
        addToPrvGrpList(documentSnapshot['Admin']),
      }
    });
    final documentSnapshot = documentReference.set({
      'AdminGrpId': null,
    }, SetOptions(merge: true));
  }

  void addToPrvGrpList(String grpId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(currentUser?.uid);

    await documentReference.set({
      'PreviousGroups': FieldValue.arrayUnion([grpId]),
    }, SetOptions(merge: true));
  }

  void addToJoinedList(String grpId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(currentUser?.uid);

    await documentReference.set({
      'Joined': FieldValue.arrayUnion([grpId]),
    }, SetOptions(merge: true));
  }

  void addToRequestedToJoinList(String grpId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(currentUser?.uid);
    await documentReference.set({
      'RequestedToJoin': FieldValue.arrayUnion([grpId]),      // arrayUnion() adds elements to an array but only elements not already present
    }, SetOptions(merge: true));
  }

  void addToRequestsFromList(String grpID) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final documentReference = FirebaseFirestore.instance.collection(
        'usergrpdata').doc(currentUser?.uid);
    List<String>? li;
    await documentReference.get().then((DocumentSnapshot documentSnapshot) =>
    {
      if(documentSnapshot.exists) {
        li = documentSnapshot['RequestsFrom'],
      }
    });
    li!.insert(0, grpID);
    final documentSnapshot = documentReference.set({
      'RequestsFrom': li,
    }, SetOptions(merge: true));
  }

  Future<UserGrpDataModel?> getUserGrpData(String uid) async {
    try {
      final DocumentReference documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(uid);
      final documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        // print(documentSnapshot.data());
        return UserGrpDataModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        // create the document
        final UserGrpDataModel userGrpDataModel = UserGrpDataModel(adminGrpId: null, joined: [], previousGroups: [], requestsFrom: [], requestedToJoin: []);
        await documentReference.set(userGrpDataModel.toJson());
        return userGrpDataModel;
      }
    } on FirebaseException catch(e) {
      if(kDebugMode) {
        print("Failed to fetch user profile ${e.code}: ${e.message}");
      }
    }
    catch(e) {
      // return ProfileModel(uid: '', name: '', email: '');
      // print("exception");
      throw Exception(e.toString());
    }
    return null;
  }

  Future<List<GroupModel>?> getPreviousGroupsList(String uid) async {
    try {
      List<GroupModel> previousGroups = [];
      List<dynamic> previousGroupsId = [];
      Map<String, dynamic> map;
      DocumentReference documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(uid);
      await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
        if(documentSnapshot.exists) {
          map = documentSnapshot.data() as Map<String, dynamic>,
          previousGroupsId = map['PreviousGroups'] as List<dynamic>,
        }
      });
      GroupModel? grpModel;
      for(String grpId in previousGroupsId) {
        documentReference = FirebaseFirestore.instance.collection('groups').doc(grpId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            grpModel = GroupModel.fromJson(documentSnapshot.data() as Map<String, dynamic>),
            previousGroups.add(grpModel!),
          }
        });
      }
      // print(previousGroups[0].category);

      return previousGroups;
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