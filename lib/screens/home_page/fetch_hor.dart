import 'package:flutter/material.dart';
import 'horizontal_groups.dart';

class FetchHor extends StatefulWidget {
  const FetchHor({Key? key}) : super(key: key);

  @override
  State<FetchHor> createState() => _FetchHorState();
}

class _FetchHorState extends State<FetchHor> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: ScrollPhysics(
      //   parent:
      // ),
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.horizontal,
      itemExtent: 270.0,  // to fix the width of each item
      children: const <Widget>[
        HorGroup(),
        HorGroup(),
        HorGroup(),
        HorGroup(),
        HorGroup(),
      ],
    );
  }
}
