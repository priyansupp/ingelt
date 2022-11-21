import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/group_model.dart';

class GroupRepository {

  Future<GroupModel?> createGroup(GroupModel groupModel) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    try {
      // print("HELLO ${groupModel}");
      // DocumentReference documentReference =
      final DocumentReference documentReference = FirebaseFirestore.instance.collection('groups').doc();
      groupModel.grpId = documentReference.id;
      // print("Hello ${groupModel.grpId}");
      await documentReference.set({
        // groupModel.toJson()    // idk why this is not working
        'GrpName': groupModel.grpName,
        'GrpId': groupModel.grpId,
        'GrpAdmin': groupModel.grpAdmin,
        'Time': groupModel.time,
        'Date': groupModel.date,
        'Participants': groupModel.participants,
        'Topic': groupModel.topic,
        'Description': groupModel.description,
        'Level': groupModel.level,
        'Category': groupModel.category
      });

        // adding this grpId to the UserGrpData collection, as the currentUser is the admin of a newly created group.
      // print("Hello2 ${groupModel.grpId}");
      await FirebaseFirestore.instance.collection('usergrpdata').doc(currentUser!.uid).update({
      'AdminGrpId': groupModel.grpId
      });

    } on FirebaseException catch(e) {
      if(kDebugMode) {
        print("Some k debug ${e.toString()} and ${e.message}");
      }
    } catch(e) {
      print(e.toString());
    }
    return groupModel;
  }

  // Future<GroupModel?> deleteGroup(String grpID) {
  //
  // }
  //
  // Future<GroupModel?> updateGroupTime() {
  //
  // }
  //
  // Future<GroupModel?> addParticipants() {
  //
  // }

  Future<GroupModel?> getGroupDetails(String grpId) async {
    try {
      final DocumentReference documentReference = FirebaseFirestore.instance
          .collection('groups').doc(grpId);
      final documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        // print(documentSnapshot.data());
        return GroupModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      } else {
        // print('could not fetch');
        return null;
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed to fetch the group ${e.code}: ${e.message}");
      }
    }
    catch (e) {
      // return ProfileModel(uid: '', name: '', email: '');
      print("exception");
      throw Exception(e.toString());
    }
    return null;
  }

  Future<List<GroupModel>>? getGeneralGroups() async {
    List<GroupModel> generalGroups = [];
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('groups');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collectionReference.get();

    // Get data from docs and convert map to List
    final allDocuments = querySnapshot.docs.map((doc) => doc.data()).toList();

    // convert all docs into GroupModel
    return allDocuments.map((doc) => GroupModel.fromJson(doc as Map<String, dynamic>)).toList();
  }
}