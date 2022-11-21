import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/profile_event.dart';
import 'package:ingelt/data/models/profile_model.dart';
import 'package:file_picker/file_picker.dart';
import '../../business_logic/blocs/profile_bloc.dart';
import '../../business_logic/blocs/profile_state.dart';
import '../../shared/utils.dart';
import '../../shared/widgets/circular_pic.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ingelt/shared/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final currentUser = FirebaseAuth.instance.currentUser!;   // user can be signed in from google or by mail


  // image picker
  void pickImage(ImageSource s) {
    // final ImagePicker _picker = ImagePicker();
    try {
      // _picker.pickImage(source: ImageSource.gallery).then((value) => {
      //   context.read<ProfileBloc>().add(AddURLEvent(result: value!)),
      //   print("url added"),
      // }).then((value) => {
      //   context.read<ProfileBloc>().add(GetProfileEvent(uid: currentUser.uid)),
      // });
      FilePicker.platform.pickFiles(allowMultiple: false).then((value) => {
        context.read<ProfileBloc>().add(AddURLEvent(result: value!)),
        print("url added"),
      }).then((value) => {
        context.read<ProfileBloc>().add(GetProfileEvent(uid: currentUser.uid)),
      });

    } on PlatformException catch(e) {
      Utils.showSnackBar('Failed to pick an image: $e');
    }
  }

  // @override
  // void initState() {
  //   context.read<ProfileBloc>().add(GetProfileEvent(uid: currentUser.uid));
  //   // TODO: implement initState
  //   super.initState();
  // }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();

  // lists
  List<String> labels = ['Name', 'Skill', 'Designation', 'Company Name', 'Phone', 'Location', 'Website', 'College/University'];
  List<String> values = ['Priyanshu Jaiswal', 'WebD', 'Founder', 'WebD developments', '974289782', 'Pakistan', 'www.pk.com', 'IIT Guwahati'];




  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [_nameController, _skillController, _designationController, _companyNameController, _phoneController, _locationController, _websiteController, _universityController];
    return SafeArea(
      child: Scaffold(
              body: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 230.0,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/home_title_bg.jpg',
                                  ),
                                  opacity: 0.15,
                                  fit: BoxFit.cover
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 130.0,
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900,
                                color: AppThemeData.blackishTextColor
                              ),
                            ),
                          ),

                          // Positioned(
                          //   top: 130.0,
                          //   child: Container(
                          //     color: Colors.black,
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 70.0,
                          //   ),
                          // ),

                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if(state is ProfileLoadedState) {
                                ProfileModel? profileModel = state
                                    .profileModel;
                                print("photoURL is : ${profileModel!.photoURL}");
                                return Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 65.0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 60.0,
                                      child: profileModel.photoURL != null ?
                                      ClipOval(
                                        child: Image.network(
                                          profileModel.photoURL!,
                                          width: 130.0,
                                          height: 130.0,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                          :
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.photo_camera,
                                          color: AppThemeData.blackishTextColor,
                                        ),
                                        iconSize: 70.0,
                                      ),
                                    ),
                                  ),
                                );
                              } else if (state is ProfileLoadingState) {
                                return const CircularProgressIndicator();
                              } else if(state is ProfileErrorState) {
                                return Center(child: Text(state.error),);
                              }
                              else {
                                print(state);
                                return const Center(child: Text("Some error occurred"),);
                              }
                            }
                          ),

                          Positioned(
                            top: 145.0,
                            right: 135.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 14.0,
                              child: IconButton(
                                onPressed: () {
                                  pickImage(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                  // showModalBottomSheet<void>(
                                  //     context: context,
                                  //     builder: (BuildContext context) {
                                  //       return Container(
                                  //         height: 300.0,
                                  //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  //         child: Center(
                                  //           child: Column(
                                  //             mainAxisAlignment: MainAxisAlignment.center,
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisAlignment: MainAxisAlignment.center,
                                  //                 children: [
                                  //                   ElevatedButton(onPressed: () {
                                  //                     pickImage(ImageSource.gallery);
                                  //                     // context.read<ProfileBloc>().add(GetProfileEvent(uid: currentUser.uid));
                                  //                     Navigator.of(context).pop();
                                  //                   }, child: const Text('Choose from gallery')),
                                  //                   const SizedBox(width: 20.0,),
                                  //                   ElevatedButton(onPressed: () {
                                  //                     pickImage(ImageSource.camera);
                                  //                     // context.read<ProfileBloc>().add(GetProfileEvent(uid: currentUser.uid));
                                  //                     Navigator.of(context).pop();
                                  //                   }, child: const
                                  //                   Text('Click a photo')),
                                  //                 ],
                                  //               ),
                                  //               const SizedBox(height: 50.0,),
                                  //               // ElevatedButton(onPressed: () {
                                  //               //   setState(() {
                                  //               //     image = null;
                                  //               //   });
                                  //               //   Navigator.of(context).pop();
                                  //               // }, child: const
                                  //               // Text('Remove photo')),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       );
                                  //     }
                                  // );
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  size: 23.0,
                                ),
                                color: AppThemeData.primaryAppColor
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 0.0,),

                    Expanded(
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if(state is ProfileLoadedState) {
                            ProfileModel? profileModel = state.profileModel;
                            List<String?> initValues = [profileModel?.name, profileModel?.skill, profileModel?.designation, profileModel?.company, profileModel?.phone, profileModel?.location, profileModel?.website, profileModel?.university];
                            return ListView.builder(
                              itemCount: 8,
                              itemBuilder: (context, index) {

                                return Inputs(label: labels[index], initValue: initValues[index], controller: controllers[index],);
                              },
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 10.0,),

                    SizedBox(
                      height: 40.0,
                      width: 130.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                          backgroundColor: AppThemeData.primaryAppColor,
                          foregroundColor: Colors.white
                        ),
                        onPressed: () {
                          context.read<ProfileBloc>().add(SaveProfileInfoEvent(photoURL: "", email: currentUser.email!, name: _nameController.text, phone: _phoneController.text, location: _locationController.text, website: _websiteController.text, designation: _designationController.text, university: _universityController.text, skill: _skillController.text, company: _companyNameController.text));
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10.0,),


                  ],
                ),
              ),
            ),
          );
  }
}

class Inputs extends StatefulWidget {
  final String label;
  final String? initValue;
  final TextEditingController controller;
  const Inputs({Key? key, required this.label, required this.controller, required this.initValue}) : super(key: key);

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {

  // only for Skill thing.
  String dropDownValue = 'Skill 1';
  // List of items in our dropdown menu
  var items = [
    'Skill 1',
    'Skill 2',
    'Skill 3',
    'Skill 4',
    'Skill 5',
  ];

  @override
  Widget build(BuildContext context) {
    if(widget.initValue != null) {
      widget.controller.text = widget.initValue!;
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0,),
      child: widget.label == 'Skill' ?
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500
            ),
          ),
          DropdownButton(

            // Initial Value
            value: dropDownValue,

            // text Styles
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: AppThemeData.blackishTextColor,
            ),

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                // print(newValue);
                dropDownValue = newValue!;
                widget.controller.text = dropDownValue;
                // print("HTHt ${widget.controller.text}");
              });
            },
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 15.0,
                fontWeight: FontWeight.w500
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 35.0,
            child: TextFormField(
              controller: widget.controller,
              // initialValue: widget.initValue.,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: AppThemeData.blackishTextColor,
              ),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5,
                          style: BorderStyle.solid,
                          color: Colors.grey.shade900
                      )
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: AppThemeData.secondaryAppColor,
                      )
                  )
              ),
            ),
          )
        ],
      ),

    );
  }
}

