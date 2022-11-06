import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';

class CircularPic extends StatefulWidget {
  const CircularPic({Key? key}) : super(key: key);

  @override
  State<CircularPic> createState() => _CircularPicState();
}

class _CircularPicState extends State<CircularPic> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundColor: AppThemeData.primaryAppColor,
      child: const CircleAvatar(
        radius: 28.0,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(
              'assets/ingelt-logo.png'
          ),
        ),
      ),
    );
  }
}
