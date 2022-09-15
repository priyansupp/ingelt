import 'package:flutter/material.dart';

class VerGroup extends StatefulWidget {
  final String date, desc, category, admin, adminDesc;
  const VerGroup({Key? key, required this.date, required this.desc, required this.category, required this.admin, required this.adminDesc}) : super(key: key);

  @override
  State<VerGroup> createState() => _VerGroupState();
}

class _VerGroupState extends State<VerGroup> {

  TextStyle customStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 10.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width * 0.84,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.greenAccent
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '| ${widget.date}',
            style: customStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400),
          ),
          Text(
              widget.desc,
            maxLines: 2,
            style: customStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,),
          ),
          Text(
              widget.category,
            style: customStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400, letterSpacing: 1.0),
          ),
          Row(
            children: <Widget>[
              Stack(
                fit: StackFit.passthrough,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/person.jpg'
                    ),
                    radius: 18.0,
                  ),
                  SizedBox(width: 70.0,),
                  Positioned(
                    left: 15.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/person.jpg'
                      ),
                      radius: 18.0,
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/person.jpg'
                      ),
                      radius: 18.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Joined',
                    style: customStyle,
                  ),
                  Text(
                      '12 seats remaining',
                    style: customStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 12.0),
                  ),
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.white,
            thickness: 1.5,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const CircleAvatar(
                // backgroundColor: Colors.black,
                backgroundImage: AssetImage(
                    'assets/person.jpg'
                  ),
                radius: 23.0,
              ),
              const SizedBox(width: 10.0,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                      widget.admin,
                    style: customStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w600, letterSpacing: 0.0),
                  ),
                  Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width*0.55,
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Text(
                      widget.adminDesc,
                      // "Hello I am Priyanshu, the finance non-expert you must never contact for financial advices. However do ping me up for any webdev or appdev query.",
                      maxLines: 2,
                      style: customStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,),
                      // style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis,),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
