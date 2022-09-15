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
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      height: 180.0,
      width: 275.0,
      // height: 160.0,
      // width: 250.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.greenAccent
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Finance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                width: 80.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // primary: Theme.of(context).colorScheme.primary,   // background color of button
                    primary: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Divider(
            color: Colors.white,
            thickness: 1.5,
          ),

          const Text(
            'Available Space',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
            ),
          ),
          const Text(
            'Money, Charlie, Gst...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis
            ),
          ),
          const SizedBox(height: 10.0,),
          const Padding(
            padding: EdgeInsets.only(right: 50.0),
            child: Text(
              'Description here is of something I am yet to understand but i must in order to complete the project. I am working although but the pace is not enough, but I think I will be able to sort it out.',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
