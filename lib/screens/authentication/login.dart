import 'package:flutter/material.dart';
import 'package:ingelt/screens/authentication/phone_login.dart';
import 'package:ingelt/screens/authentication/email_login.dart';
import 'package:ingelt/shared/widgets/loading.dart';

class Login extends StatefulWidget {
  final Function onClickedLogin;
  const Login({Key? key, required this.onClickedLogin}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  // manage states
  bool loading = false;
  bool phoneScreen = false;
  


  @override
  Widget build(BuildContext context) {
    return loading ? const Loading(message: 'Please wait while we log you in!',) : Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 50,
                ),
                onPressed: () {
                  widget.onClickedLogin(0);     // to first page
                },
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Container(
              height: 100.0,
              width: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ingelt-logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            !phoneScreen ? EmailLogin(setPhoneScreen: setPhoneScreen, setLoading: setLoading) : PhoneLogin(setPhoneScreen: setPhoneScreen, setLoading: setLoading),
            const SizedBox(height: 20.0,),
            Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onPressed: () {
                    widget.onClickedLogin(2);     // to signup page
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setLoading() {
    setState(() => loading = !loading);
  }

  void setPhoneScreen() {
    setState(() => phoneScreen = !phoneScreen);
  }

}
