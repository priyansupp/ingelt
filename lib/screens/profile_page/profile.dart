import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/utils.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // image
  File? image;

  Future pickImage(ImageSource s) async {
    try {
      // Pick an image
      final XFile? imageSelected = await ImagePicker().pickImage(source: s);

      if (imageSelected == null) return;

      final imageTemporary = File(imageSelected.path);
      setState(() {
        image = imageTemporary;
      }); // from variable initialized in _CreateGroupState.
    } on PlatformException catch(e) {
      Utils.showSnackBar('Failed to pick an image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            'Priyanshu Jaiswal'
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 220.0,
                width: MediaQuery.of(context).size.width,
                // color: Theme.of(context).scaffoldBackgroundColor,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                    ),
                    Positioned(
                      top: 75.0,
                      left: 25.0,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        radius: 70.0,
                        child: image != null ?
                        ClipOval(      // makes the image oval shape.
                          child: Image.file(
                            image!,
                            width: 125.0,
                            height: 125.0,
                            fit: BoxFit.cover,
                          ),
                        )
                        : IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.photo_camera,
                            color: Colors.black,
                          ),
                          iconSize: 70.0,
                        ),
                      )
                    ),

                    Positioned(
                      top: 160.0,
                      left: 120.0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 300.0,
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(onPressed: () {
                                              pickImage(ImageSource.gallery);
                                              Navigator.of(context).pop();
                                            }, child: const Text('Choose from gallery')),
                                            const SizedBox(width: 20.0,),
                                            ElevatedButton(onPressed: () {
                                              pickImage(ImageSource.camera);
                                              Navigator.of(context).pop();
                                            }, child: const
                                            Text('Click a photo')),
                                          ],
                                        ),
                                        const SizedBox(height: 50.0,),
                                        ElevatedButton(onPressed: () {
                                          setState(() {
                                            image = null;
                                          });
                                          Navigator.of(context).pop();
                                        }, child: const
                                        Text('Remove photo')),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          );
                        },
                        child: Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                              // border: Border.all(color: Colors.black, width: 2.0),
                              color: Theme.of(context).scaffoldBackgroundColor
                          ),
                          child: Icon(
                            Icons.add_circle,
                            size: 35.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 160.0,
                      right: 20.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        iconSize: 28.0,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Priyanshu Jaiswal',
                      style: TextStyle(
                          fontSize: 22.5,
                          color: Theme.of(context).secondaryHeaderColor
                      ),
                    ),
                    Text(
                      'Co-founder: Jobery',
                      style: TextStyle(
                          fontSize: 17.5,
                          color: Theme.of(context).secondaryHeaderColor
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Row(
                      children: [
                        Text(
                          'Jobery',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Theme.of(context).secondaryHeaderColor
                          ),
                        ),
                        Text(' * '),
                        Text(
                          'IIT Guwahati',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Theme.of(context).secondaryHeaderColor
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'New Delhi, Delhi, India',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Text(
                      '300 connections',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 15.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('connections?'),
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary,
                            minimumSize: Size(MediaQuery.of(context).size.width * 0.35, 40.0),
                            shape: const StadiumBorder()
                          ),
                        ),
                        const SizedBox(width: 10.0,),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.secondary,
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.35, 40.0),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              shape: const StadiumBorder()        // creates rounded borders
                          ),
                          child: const Text('more?'),
                        ),
                        const SizedBox(width: 10.0,),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.all(Radius.elliptical(30.0, 30.0)),
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_horiz_rounded),
                            iconSize: 23.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
