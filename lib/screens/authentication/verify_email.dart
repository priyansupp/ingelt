import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/screens/routing.dart';

import '../../shared/utils.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {

  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // user needs to be created before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified) {
      sendEmailVerification();

      // checking for email verification every 2 seconds
      timer = Timer.periodic(
        const Duration(seconds: 2),
          (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  Future sendEmailVerification() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      await currentUser.sendEmailVerification();
    } catch(e) {
      Utils.showSnackBar(e.toString());
    }
  }

  Future checkEmailVerified() async {
    // call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified ? const BottomRouting() : Scaffold(
      appBar: AppBar(
        title: const Text("Verify your Email"),
      ),
      body: const Center(
        child: Text(
          "Verify your Email!"
        ),
      ),
    );
  }
}
