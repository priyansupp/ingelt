import 'package:flutter/material.dart';
import 'package:ingelt/screens/authentication/first_page.dart';
import 'package:ingelt/screens/authentication/login.dart';
import 'package:ingelt/screens/authentication/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  int showAuthPages = 0;

  @override
  Widget build(BuildContext context) {
    if(showAuthPages == 0) {
      return FirstPage(onClickedFirstPage: toggle);
    } else if(showAuthPages == 1) {
      return Login(onClickedLogin: toggle);
    } else {
      return SignUp(onClickedSignUp: toggle);
    }
  }

  void toggle(int x) {
    setState(() => showAuthPages = x);
  }

}
