import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';

class FirstPage extends StatefulWidget {
  final Function onClickedFirstPage;
  const FirstPage({Key? key, required this.onClickedFirstPage}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.blackishTextColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.0,
              width: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ingelt-white-logo.png'),
                  fit: BoxFit.fill,
                ),
                // border: Border.all(width: 2.0, color: Colors.white)
              ),
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () {
                widget.onClickedFirstPage(1);       // to login page
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 60.0),
                backgroundColor: AppThemeData.secondaryAppColor,
                foregroundColor: Colors.white,
                shape: const StadiumBorder()        // creates rounded borders
              ),
              child: const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
            OutlinedButton(
              onPressed: () {
                widget.onClickedFirstPage(2);     // to signup page
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: AppThemeData.secondaryAppColor,
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 60.0),
                  side: BorderSide(
                    color: AppThemeData.secondaryAppColor,
                  ),
                  shape: const StadiumBorder()        // creates rounded borders
              ),
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

