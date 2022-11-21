import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/screens/authentication/auth_route.dart';
import 'package:ingelt/screens/routing.dart';
import 'package:ingelt/shared/widgets/loading.dart';

import 'business_logic/blocs/profile_bloc.dart';
import 'business_logic/blocs/profile_event.dart';

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
            // print(snapshot.data?.email);
            // print(snapshot.data?.displayName);
            // print(snapshot.data);
          return Builder(
            builder: (context) {
              final currentUser = FirebaseAuth.instance.currentUser;
              // print(currentUser!.providerData);
              if(currentUser!.providerData[0].providerId == 'google.com') {
                // print(snapshot.data!.email);
                // print(snapshot.data?.displayName);
                // print(snapshot.data?.photoURL);
                context.read<ProfileBloc>().add(SaveProfileInfoEvent(photoURL: snapshot.data!.photoURL, email: snapshot.data!.email!, name: snapshot.data!.displayName!, phone: null, location: null, skill: null, designation: null, company: null, website: null, university: null));
              } else if (currentUser!.providerData[0].providerId == 'password') {

                context.read<ProfileBloc>().add(SaveProfileInfoEvent(photoURL: null, email: currentUser.providerData[0].email!, name: "", phone: null, location: null, skill: null, designation: null, company: null, website: null, university: null));
            }
               return const BottomRouting();
            }
          );
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
