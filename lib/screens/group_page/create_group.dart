import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingelt/models/group_model.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/shared/constants.dart';
import 'package:ingelt/shared/utils.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  final UserModel groupAdmin = groups[0].admin;

  // controllers
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40.0,),
              Center(     // gets the rounded white background container in center of sizedbox
                child: GestureDetector(
                  onTap: () {
                    // pickImage(ImageSource.gallery);
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
                    height: 140.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                      border: Border.all(color: Colors.black, width: 2.0),
                      // color: Theme.of(context).colorScheme.primary
                    ),
                    child: Stack(
                      children: <Widget>[
                        image != null ?
                        Center(     // gets the icon in center of rounded white background container
                          child: ClipOval(      // makes the image oval shape.
                            child: Image.file(
                                image!,
                              width: 140.0,
                              height: 140.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        : Center(     // gets the icon in center of rounded white background container
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
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
                                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
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
                  ),
                )
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  controller: _topicController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter topic',
                    labelText: 'Topic',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(borderRadius)),
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  controller: _descriptionController,
                  // textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Brief description of the topic',
                      labelText: 'Description',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(borderRadius)),
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton.icon(
                onPressed: () {
                  // if(_formKey.currentState!.validate()){
                  //submit form
                  // }
                },      // signs in to home page
                icon: const Icon(
                  Icons.group_add_outlined,
                  color: Colors.white,
                ),
                label: const Text(
                  'Create Group',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 60.0),
                  primary: Theme.of(context).colorScheme.secondary,
                  shape: const StadiumBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
