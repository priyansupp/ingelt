import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/ingelt_group_model.dart';

class IngeltGroupRepository {


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

  Future<IngeltGroupModel?> getIngeltGroupDetails(String grpId) async {
    try {
      final DocumentReference documentReference = FirebaseFirestore.instance
          .collection('ingeltgroups').doc(grpId);
      final documentSnapshot = await documentReference.get();
      if (documentSnapshot.exists) {
        // print(documentSnapshot.data());
        return IngeltGroupModel.fromJson(
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

  Future<List<IngeltGroupModel>>? getIngeltGroups() async {
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('ingeltgroups');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collectionReference.get();

    // Get data from docs and convert map to List
    final allDocuments = querySnapshot.docs.map((doc) => doc.data()).toList();

    // convert all docs into GroupModel
    return allDocuments.map((doc) => IngeltGroupModel.fromJson(doc as Map<String, dynamic>)).toList();
  }
}