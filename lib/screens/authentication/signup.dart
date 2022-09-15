import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/services/database.dart';
import 'package:ingelt/shared/constants.dart';
import 'package:ingelt/shared/widgets/loading.dart';
import 'package:ingelt/shared/utils.dart';

class SignUp extends StatefulWidget {
  final Function onClickedSignUp;
  const SignUp({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // final user = FirebaseAuth.instance.currentUser!;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  // state management
  bool loading = false;
  bool secureConfirmPassText = true;


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
    return loading ? const Loading(message: 'Please wait while we Register you!',) : Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    widget.onClickedSignUp(0);      // to first page
                  },
                ),
              ),
              // const SizedBox(
              //   height: 50.0,
              // ),
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

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60.0,
                child: TextField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  // maxLength: 20,
                  decoration: InputDecoration(
                      labelText: "Name",
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
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60.0,
                child: TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) => email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
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
                      )),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60.0,
                child: TextFormField(
                  controller: _phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Phone",
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
                  // autovalidateMode: AutovalidateMode.onUserInteraction,      // validates at every char input
                  validator: (value) {            // to show frontend form validation error on screen
                      if(value == null) {
                        return 'Password can\'t be null.';
                      } else if(value.length < 6) {
                        return 'Must be atleast 6 characters.';
                      } else if(!value.contains('@') && !value.contains('#') && !value.contains('!') && !value.contains('&') && !value.contains('\$')) {
                        return 'Must contain atleast one special char(!, @, #, &, \$)';
                      } else {
                        return null;
                      }
                    },
                  decoration: InputDecoration(
                      labelText: "Create Password",
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

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 60.0,
                child: TextFormField(
                  controller: _confirmPasswordController,
                  textInputAction: TextInputAction.next,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {            // to show frontend form validation error on screen
                    if(value == null) {
                      return 'Confirm Password can\'t be null.';
                    } else if(value != _passwordController.text) {
                      return 'Passwords don\'t match.';
                    }else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
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
                    suffixIcon: IconButton(
                      icon: secureConfirmPassText ? Icon(
                          Icons.security,
                        color: Theme.of(context).colorScheme.primary,
                      ) : Icon(
                        Icons.remove_red_eye,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() => secureConfirmPassText = !secureConfirmPassText);
                      },
                    )
                  ),
                  obscureText: secureConfirmPassText,
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                   signUp();
                  }
                },         // signs up
                icon: const Icon(
                  Icons.lock_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Sign Up',
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
              const SizedBox(height: 72.0,),
              Divider(
                color: Theme.of(context).colorScheme.primary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      widget.onClickedSignUp(1);      // to login page
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future signUp() async {

    setState(() => loading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
      User? user = userCredential.user;
      await DatabaseService(uid: user!.uid).updateUserData(_emailController.text.trim(), _nameController.text, null, _phoneController.text);
    } on FirebaseAuthException catch(e) {
      setState(() => loading = false);
      // print('Couldn\'t Sign up with those credentials.');
      // print(e);
      Utils.showSnackBar(e.message);        // to show the database side error message on screen
    }
  }
}
