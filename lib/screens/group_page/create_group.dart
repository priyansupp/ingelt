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


  @override
  Widget build(BuildContext context) {
    return
      // appBar: AppBar(
      //   // elevation: 0.0,
      //   toolbarHeight: 62.0,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: const <Widget>[
      //       Text(
      //         'New Group',
      //         style: TextStyle(
      //           fontSize: 22.0,
      //           // color: Theme.
      //         ),
      //       ),
      //       Text(
      //         'Add subject',
      //         style: TextStyle(
      //           fontSize: 13.0
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      Column(
        children: <Widget>[
          const SizedBox(height: 40.0,),
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
              Navigator.of(context).pop();
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
      );
  }
}
