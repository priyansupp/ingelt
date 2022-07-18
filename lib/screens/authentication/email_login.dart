import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';
import 'package:ingelt/shared/utils.dart';

class EmailLogin extends StatefulWidget {
  final Function setPhoneScreen;
  final Function setLoading;
  const EmailLogin({Key? key, required this.setPhoneScreen, required this.setLoading}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // disposes the controllers when the widget is unmounted from the widget tree.
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60.0,
            child: TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (email) => (email != null && !EmailValidator.validate(email)) ? 'Enter a valid email.' : null,
              decoration: InputDecoration(
                labelText: "Email",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2.0,
                  ),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 60.0,
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2.0,
                    ),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(borderRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.0,
                    ),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(borderRadius)),
                  )),
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton.icon(
            onPressed: () {
              if(_formKey.currentState!.validate()){
                signIn();
              }
            },      // signs in to home page
            icon: const Icon(
              Icons.lock_open,
              color: Colors.white,
            ),
            label: const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 60.0),
              primary: Theme.of(context).colorScheme.secondary,
              shape: const StadiumBorder(),
            ),
          ),
          const SizedBox(height: 20.0,),
          GestureDetector(
            onTap: () {
              widget.setPhoneScreen();       // sets to true
            },
            child: Text(
              'Login via Phone number',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15.0,
                  decoration: TextDecoration.underline
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sign In method
  Future signIn() async {

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;         // return/don't sign in if not valid.

    widget.setLoading();
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
      print("Logged in");
    } on FirebaseAuthException catch(e) {
      widget.setLoading();
      // print("Could not sign in!!!");
      // print(e);
      Utils.showSnackBar(e.message);        // to show the error message on screen
    }
  }

}
