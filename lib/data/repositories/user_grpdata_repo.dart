import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ingelt/data/models/group_model.dart';

import '../models/profile_model.dart';
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


  Future<List<GroupModel>?> getRequestedToGroups(String uid) async {
    try {
      List<GroupModel> requestedToGroups = [];
      List<dynamic> requestedToGroupsId = [];
      Map<String, dynamic> map;
      DocumentReference documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(uid);
      await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
        if(documentSnapshot.exists) {
          map = documentSnapshot.data() as Map<String, dynamic>,
          requestedToGroupsId = map['RequestedToJoin'] as List<dynamic>,
        }
      });
      GroupModel? grpModel;
      for(String grpId in requestedToGroupsId) {
        print(grpId);
        documentReference = FirebaseFirestore.instance.collection('groups').doc(grpId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            grpModel = GroupModel.fromJson(documentSnapshot.data() as Map<String, dynamic>),
            requestedToGroups.add(grpModel!),
          }
        });
      }
      // print(previousGroups[0].category);
      // print(requestedToGroups);

      return requestedToGroups;
    } on FirebaseException catch(e) {
      if(kDebugMode) {
        print("Failed to fetch requested to groups... ${e.code}: ${e.message}");
      }
    }
    catch(e) {
      // return ProfileModel(uid: '', name: '', email: '');
      throw Exception(e.toString());
    }
    return null;
  }


  Future<List<GroupModel>?> getAllyGroups(String uid) async {
    try {
      List<GroupModel> allyGroups = [];
      List<dynamic> allyGroupsId = [];
      Map<String, dynamic> map;
      DocumentReference documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(uid);
      await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
        if(documentSnapshot.exists) {
          map = documentSnapshot.data() as Map<String, dynamic>,
          allyGroupsId = map['Joined'] as List<dynamic>,
        }
      });
      GroupModel? grpModel;
      for(String grpId in allyGroupsId) {
        print(grpId);
        documentReference = FirebaseFirestore.instance.collection('groups').doc(grpId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            grpModel = GroupModel.fromJson(documentSnapshot.data() as Map<String, dynamic>),
            allyGroups.add(grpModel!),
          }
        });
      }
      // print(previousGroups[0].category);
      // print(requestedToGroups);

      return allyGroups;
    } on FirebaseException catch(e) {
      if(kDebugMode) {
        print("Failed to fetch ally groups... ${e.code}: ${e.message}");
      }
    }
    catch(e) {
      // return ProfileModel(uid: '', name: '', email: '');
      throw Exception(e.toString());
    }
    return null;
  }


  Future<List<ProfileModel>?> getRequestsFrom(String uid) async {
    try {
      List<ProfileModel> requestsFrom = [];
      List<dynamic> requestsFromId = [];
      Map<String, dynamic> map;
      DocumentReference documentReference = FirebaseFirestore.instance.collection('usergrpdata').doc(uid);
      await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
        if(documentSnapshot.exists) {
          map = documentSnapshot.data() as Map<String, dynamic>,
          requestsFromId = map['RequestsFrom'] as List<dynamic>,
        }
      });
      ProfileModel? userModel;
      for(String userId in requestsFromId) {
        print(userId);
        documentReference = FirebaseFirestore.instance.collection('users').doc(userId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            userModel = ProfileModel.fromJson(documentSnapshot.data() as Map<String, dynamic>),
            requestsFrom.add(userModel!),
          }
        });
      }
      // print(previousGroups[0].category);
      // print(requestedToGroups);

      return requestsFrom;
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