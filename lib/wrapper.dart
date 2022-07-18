import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/screens/authentication/auth_route.dart';
import 'package:ingelt/screens/home_page/home.dart';
import 'package:ingelt/shared/widgets/loading.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading(message: '',);
          }else if(snapshot.hasData) {
            return Home();
          } else if(snapshot.hasError) {
            return const Text('Some Error Occurred. Please try again');
          } else {
            return const AuthPage();      // maintains routing of auth pages, i.e first page, login page, sign up page
          }
          // return const Loading(message: 'heelooo');
        },
      ),
    );
  }
}
