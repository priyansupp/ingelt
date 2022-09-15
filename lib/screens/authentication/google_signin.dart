import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ingelt/services/database.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;   // holds the info of user

  GoogleSignInAccount get user => _user!;    // getter method to get google sign in account

  Future googleLogin() async {    // google login method
    final googleUser = await googleSignIn.signIn();    // shows the pop up for sign in
    if(googleUser == null) return;    // return if user doesn't selects any account

    _user = googleUser;   // if the user has selected some google account then that account becomes our real user

    final googleAuth = await googleUser.authentication;   // authenticates the google user(by asking for password or something)

    final credentials = GoogleAuthProvider.credential(    // accessing the credentials of the user and then we notify firebase about the signed in user.
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );      // contains credentials like token, etc.

    // print(credentials.providerId);    // prints 'google.com' because google is the provider. For email password, it prints 'password'.


    // contains credentials that are actually stored in database.
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credentials);    // signs up with the google credentials
    User? user = userCredential.user;
    notifyListeners();

    await DatabaseService(uid: user!.uid).updateUserData(googleUser.email, googleUser.displayName!, googleUser.photoUrl!, null);
  }
}
