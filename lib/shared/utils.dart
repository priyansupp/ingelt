import 'package:flutter/material.dart';

class Utils {

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  // a static method (or static function) is a method defined as a member of a class but can be directly called without creating an object instance via the constructor.
  static showSnackBar(String? message) {

    if(message == null) return;

    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.red,);    // content of snack-bar

    messengerKey.currentState!
      ..removeCurrentSnackBar()       // removes current snackbar and shows new snackbar with error message
      ..showSnackBar(snackBar);

  }



}