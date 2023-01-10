import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';

import '../../data/models/ingelt_group_model.dart';

class HorGroup extends StatefulWidget {
  final IngeltGroupModel ingeltGroupModel;
  const HorGroup({Key? key, required this.ingeltGroupModel}) : super(key: key);

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
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
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
              SizedBox(
                width: 110.0,
                child: Text(
                  '${widget.ingeltGroupModel.grpName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              SizedBox(
                width: 60.0,
                height: 30.0,
                child: ElevatedButton(
                  onPressed: ()  {
                    FirebaseAuth.instance.signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Theme.of(context).colorScheme.primary,   // background color of button
                    backgroundColor: Colors.white,
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
                '${widget.ingeltGroupModel.participants.length} Joined',
                style: customStyle,
              )
            ],
          ),

          // const SizedBox(height: 10.0,),
          Text(
            // 'Description here is of something I am yet to understand but i must in order to complete the project. I am working although but the pace is not enough, but I think I will be able to sort it out.',
            '${widget.ingeltGroupModel.description}',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
