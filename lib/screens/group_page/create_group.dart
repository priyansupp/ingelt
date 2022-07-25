import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/models/group_model.dart';
import 'package:ingelt/models/user_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  final UserModel groupAdmin = groups[0].admin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // elevation: 0.0,
          toolbarHeight: 62.0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'New Group',
                style: TextStyle(
                  fontSize: 22.0,
                  // color: Theme.
                ),
              ),
              Text(
                'Add subject',
                style: TextStyle(
                  fontSize: 13.0
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 40.0,),
            Center(     // gets the rounded white background container in center of sizedbox
              child: Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  border: Border.all(color: Colors.black, width: 2.0),
                  // color: Theme.of(context).colorScheme.primary
                ),
                child: Stack(
                  children: <Widget>[
                    Center(     // gets the icon in center of rounded white background container
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.photo_camera,
                          color: Colors.black,
                        ),
                        iconSize: 70.0,
                      ),
                    ),
                    Positioned(
                      right: -0.0,
                      bottom: -0.0,
                      child: Container(
                        height: 45.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100.0)),
                            // border: Border.all(color: Colors.black, width: 2.0),
                            color: Colors.grey.shade500
                        ),
                        child: Icon(
                          Icons.add_circle,
                          size: 35.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
