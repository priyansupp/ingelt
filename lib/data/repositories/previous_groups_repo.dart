import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/group_model.dart';

class PreviousGroupsRepository {
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
        print(grpId);
        documentReference = FirebaseFirestore.instance.collection('groups').doc(grpId);
        await documentReference.get().then((DocumentSnapshot documentSnapshot) => {
          if(documentSnapshot.exists) {
            grpModel = GroupModel.fromJson(documentSnapshot.data() as Map<String, dynamic>),
            previousGroups.add(grpModel!),
          }
        });
      }
      // print(previousGroups[0].category);
      print(previousGroups);

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