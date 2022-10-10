import 'package:flutter/material.dart';
import 'ally_req_group.dart';

class Ally extends StatefulWidget {
  const Ally({Key? key}) : super(key: key);

  @override
  State<Ally> createState() => _AllyState();
}

class _AllyState extends State<Ally> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const AllyReqGroup();
        },
        itemCount: 5,

      ),
    );
  }
}

