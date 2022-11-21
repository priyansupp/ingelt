import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ingelt/business_logic/blocs/profile_event.dart';
import 'package:ingelt/screens/authentication/google_signin.dart';
import 'package:ingelt/screens/authentication/phone_login.dart';
import 'package:ingelt/screens/authentication/email_login.dart';
import 'package:ingelt/shared/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:ingelt/shared/constants.dart';
import '../../business_logic/blocs/profile_bloc.dart';


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

            // or line
            const SizedBox(height: 20.0,),
            const Text(
              '---or---',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0
              ),
            ),
            const SizedBox(height: 20.0,),

            // google sign in button
            ElevatedButton.icon(
                onPressed: () async {
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  late GoogleSignInAccount googleUser;
                  await provider.googleLogin().then((value) => {
                    googleUser = provider.user,
                    print(googleUser.photoUrl),
                    context.read<ProfileBloc>().add(SaveProfileInfoEvent(photoURL: googleUser.photoUrl, email: googleUser.email, name: googleUser.displayName!, phone: null, location: null, skill: null, designation: null, company: null, website: null, university: null)),
                  });
                },
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppThemeData.primaryAppColor,   // color of content on the button, i.e the icon and text
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 60.0),
                shape: const StadiumBorder(),
              ),
            ),
            const SizedBox(height: 50.0,),

            // sign up link
            Divider(
              color: AppThemeData.primaryAppColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppThemeData.secondaryAppColor,
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
