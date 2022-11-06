import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:file_picker/file_picker.dart';
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

  final generalUser = FirebaseAuth.instance.currentUser!;   // user can be signed in from google or by mail

  // getting the user with its uid from firestore
  Future<UserModel?> readUser() async {
    final documentReference = FirebaseFirestore.instance.collection('users').doc(generalUser.uid);
    final documentSnapshot = await documentReference.get();
    // print('hello fetching rn');
    if (documentSnapshot.exists) {
      // print(documentSnapshot.data());
      return UserModel.fromJson(documentSnapshot.data()!);
    } else {
      // print('could not fetch');
      return null;
    }
  }

  // image
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future uploadImage(FilePickerResult result) async{
    // final path = result.files.single.path;
    final fileName = result.files.first.name;
    // print(path);     // complete path of the picked file
    // print(fileName);    // just the name and extension of the picked file.

    final destination = 'user/$fileName';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(destination);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() => {});

    final urlDownload = await snapshot.ref.getDownloadURL();

    final documentReference = FirebaseFirestore.instance.collection('users').doc(generalUser.uid);
    final documentSnapshot = await documentReference.update(
        {
          'photoURL': urlDownload
        }
    );
    setState(() {

    });
  }

  Future pickImage(ImageSource s) async {
    try {

      final result = await FilePicker.platform.pickFiles(allowMultiple: false);
      if(result == null) return;

      setState(() {
        pickedFile = result.files.first;
      });

      await uploadImage(result);
    } on PlatformException catch(e) {
      Utils.showSnackBar('Failed to pick an image: $e');
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();

  // lists
  List<String> labels = ['Name', 'Skill', 'Designation', 'Company Name', 'Phone', 'E-mail', 'Location', 'Website', 'College/University'];
  List<String> values = ['Priyanshu Jaiswal', 'WebD', 'Founder', 'WebD developments', '974289782', 'priyansupp@outlook.com', 'Pakistan', 'www.pk.com', 'IIT Guwahati'];




  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [_nameController, _skillController, _designationController, _companyNameController, _phoneController, _emailController, _locationController, _websiteController, _collegeController];
    return SafeArea(
      child: FutureBuilder<UserModel?>(
        future: readUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final user = snapshot.data;
            return Scaffold(
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

                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 65.0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 60.0,
                                child: user!.photoURL != null ?
                                ClipOval(
                                  child: Image.network(
                                    user.photoURL!,
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
                          ),

                          Positioned(
                            top: 145.0,
                            right: 135.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 14.0,
                              child: IconButton(
                                onPressed: () {
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
                                                // ElevatedButton(onPressed: () {
                                                //   setState(() {
                                                //     image = null;
                                                //   });
                                                //   Navigator.of(context).pop();
                                                // }, child: const
                                                // Text('Remove photo')),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
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
                      child: ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Inputs(label: labels[index], value: values[index], controller: controllers[index],);
                        },
                      ),
                    ),

                    SizedBox(
                      height: 40.0,
                      width: 130.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                          backgroundColor: AppThemeData.primaryAppColor,
                          foregroundColor: Colors.white
                        ),
                        onPressed: () {},
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
            );
          } else if (snapshot.hasError) {
            print("this is the error ${snapshot.error}");
            return const Center(child: Text('Something went wrong'));
          } else {
            // loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}

class Inputs extends StatefulWidget {
  final String label, value;
  final TextEditingController controller;
  const Inputs({Key? key, required this.label, required this.value, required this.controller}) : super(key: key);

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0,),
      child: Column(
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

