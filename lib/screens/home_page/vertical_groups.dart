import 'package:flutter/material.dart';

class VerGroup extends StatefulWidget {
  const VerGroup({Key? key}) : super(key: key);

  @override
  State<VerGroup> createState() => _VerGroupState();
}

class _VerGroupState extends State<VerGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.green
      ),
    );
  }
}
