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
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      height: 180.0,
      width: 275.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Category',
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                width: 70.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,   // bgcolor of button
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Available Space',
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 17.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // generate list of topics here
              Text(
                'Money, Charlie, Gst...',
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Description here is of something I am yet to understand but i must in order to complete the project. I am working althought but the pace is not enough, but I think I will be able to sort it out.',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 15.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
