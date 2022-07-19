import 'package:flutter/material.dart';

class HorGroup extends StatefulWidget {
  const HorGroup({Key? key}) : super(key: key);

  @override
  State<HorGroup> createState() => _HorGroupState();
}

class _HorGroupState extends State<HorGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      height: 150.0,
      width: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red
      ),
    );
  }
}
