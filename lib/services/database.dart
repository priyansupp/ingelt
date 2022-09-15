import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({ required this.uid });

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String email, String name, String? photoURL, String? phone) async {
    return await userCollection.doc(uid).set(
        {
          'uid': uid,
          'emailAddress': email,
          'displayName': name,
          'photoURL': photoURL,
          'phone': phone
        }
    );
  }

}