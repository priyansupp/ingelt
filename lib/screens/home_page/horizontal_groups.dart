import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';

class HorGroup extends StatefulWidget {
  const HorGroup({Key? key}) : super(key: key);

  @override
  State<HorGroup> createState() => _HorGroupState();
}

class _HorGroupState extends State<HorGroup> {

  TextStyle customStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(colors: [
            // AppThemeData.primaryAppColor,
            // AppThemeData.secondaryAppColor,
            const Color.fromRGBO(18, 125, 101, 0.8),
            AppThemeData.primaryAppColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                width: 60.0,
                height: 30.0,
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

          Row(
            children: <Widget>[
              Stack(
                fit: StackFit.passthrough,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/person.jpg'
                    ),
                    radius: 12.0,
                  ),
                  SizedBox(width: 70.0,),
                  Positioned(
                    left: 15.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/person.jpg'
                      ),
                      radius: 12.0,
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/person.jpg'
                      ),
                      radius: 12.0,
                    ),
                  ),
                ],
              ),
              // const SizedBox(width: 15.0,),
              Text(
                '658 Joined',
                style: customStyle,
              )
            ],
          ),

          // const SizedBox(height: 10.0,),
          const Text(
            'Description here is of something I am yet to understand but i must in order to complete the project. I am working although but the pace is not enough, but I think I will be able to sort it out.',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
