import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';

class PhoneLogin extends StatefulWidget {
  final Function setPhoneScreen;
  final Function setLoading;
  const PhoneLogin({Key? key, required this.setPhoneScreen, required this.setLoading}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            controller: _phoneController,
            textInputAction: TextInputAction.next,
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
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton.icon(
          onPressed: () {},      // signs in to home page
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
            widget.setPhoneScreen();
          },
          child: Text(
            'Login via Email and Password',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 15.0,
                decoration: TextDecoration.underline
            ),
          ),
        ),
      ],
    );
  }
}
