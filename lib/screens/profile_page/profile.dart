import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingelt/models/user_model.dart';
import 'package:ingelt/screens/profile_page/research_exp.dart';
import 'package:ingelt/screens/profile_page/research_bar.dart';
import 'package:ingelt/screens/profile_page/settings.dart';
import '../../models/user_model.dart';
import '../../shared/utils.dart';
import 'featured.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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

  double percentage = 40;

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: FutureBuilder<UserModel?>(
        future: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data;
            // print(snapshot.data);
            // print(user!.photoURL);
            return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
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
                                    left: 18.0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 70.0,
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
                                        icon: const Icon(
                                          Icons.photo_camera,
                                          color: Colors.black,
                                        ),
                                        iconSize: 70.0,
                                      ),
                                    )
                                ),

                                user.photoURL == null? Positioned(
                                  top: 178.0,
                                  left: 127.0,
                                  child: SizedBox(
                                    height: 45.0,
                                    width: 45.0,
                                    // decoration: const BoxDecoration(
                                    //     borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                    //     // border: Border.all(color: Colors.black, width: 2.0),
                                    //     color: Colors.white
                                    // ),
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
                                      ),
                                      // size: 25.0,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ) : const SizedBox(),
                                Positioned(
                                  top: 160.0,
                                  right: 20.0,
                                  child: IconButton(
                                    icon: const Icon(Icons.settings),
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileSettings()));
                                    },
                                    iconSize: 28.0,
                                  )
                                  // child: SizedBox(
                                  //   height: 35.0,
                                  //   width: 100.0,
                                  //   child: TextButton(
                                  //     onPressed: () {},
                                  //     style: TextButton.styleFrom(
                                  //         shape: const StadiumBorder(),
                                  //         side: const BorderSide(
                                  //           color: Colors.black,
                                  //         )
                                  //     ),
                                  //     child: const Text(
                                  //       'Edit Profile',
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //         fontSize: 12.0,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.displayName,
                                  style: const TextStyle(
                                      fontSize: 22.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Text(
                                  'Co-founder: Ingelt',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 13.0,),
                                const Text(
                                  'IIT Guwahati',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                const Text(
                                  'New Delhi, Delhi, India',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                  ),
                                ),
                                // const SizedBox(height: 15.0,),
                                // Text(
                                //   '300 connections',
                                //   style: TextStyle(
                                //       fontSize: 20.0,
                                //       fontWeight: FontWeight.bold,
                                //       color: Theme.of(context).colorScheme.primary,
                                //   ),
                                // ),
                                const SizedBox(height: 15.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Theme.of(context).colorScheme.secondary,
                                          minimumSize: Size(MediaQuery.of(context).size.width * 0.35, 40.0),
                                          shape: const StadiumBorder()
                                      ),
                                      child: const Text('Connect'),
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
                                      child: const Text('Message'),
                                    ),
                                    const SizedBox(width: 10.0,),
                                    Container(
                                      height: 40.0,
                                      width: MediaQuery.of(context).size.width * 0.15,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1.0, color: Theme.of(context).colorScheme.secondary),
                                        borderRadius: const BorderRadius.all(Radius.elliptical(30.0, 30.0)),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.more_horiz_rounded),
                                        color: Theme.of(context).colorScheme.secondary,
                                        iconSize: 23.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15.0,),
                        ],
                      ),
                    ),

                    const SizedBox(height: 13.0,),

                    // Research Area container
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'RESEARCH AREA',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.5,
                                color: Colors.black
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          ResearchBar(text: 'GRAPHIC DESIGN', percentage: 40,),
                          SizedBox(height: 12.0,),
                          ResearchBar(text: 'MARKETING', percentage: 60,),
                          SizedBox(height: 12.0,),
                          ResearchBar(text: 'FINANCE', percentage: 80,),

                        ],
                      ),
                    ),

                    const SizedBox(height: 13.0,),

                    // Working container
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'FORTE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.5,
                                    color: Colors.black
                                ),
                              ),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded), iconSize: 35.0,)
                            ],
                          ),
                          const Text(
                            'Engineering is the use of scientific principles to design and build machines, structures, and other items, including bridges, tunnels, roads, vehicles, and buildings.[1] The discipline of engineering encompasses a broad range of more specialized fields of engineering, each with a more specific emphasis on particular areas of applied mathematics, applied science, and types of application. See glossary of engineering.',
                            style: TextStyle(
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                color: Colors.black
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 13.0,),

                    // Featured container
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'FEATURED',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2.5,
                                      color: Colors.black
                                  ),
                                ),
                                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded), iconSize: 35.0,)
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const [
                                Featured(text: 'Branding is the process of giving a meaning to specific subject constrained under some set of conditions and acknowledgments.',),
                                Featured(text: 'Branding is the process of giving a meaning to specific subject constrained under some set of conditions and acknowledgments.',),
                                Featured(text: 'Branding is the process of giving a meaning to specific subject constrained under some set of conditions and acknowledgments.',),
                                Featured(text: 'Branding is the process of giving a meaning to specific subject constrained under some set of conditions and acknowledgments.',),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                        ],
                      ),
                    ),

                    const SizedBox(height: 13.0,),

                    // Research Experience container
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'RESEARCH EXPERIENCE',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2.5,
                                    color: Colors.black
                                ),
                              ),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded), iconSize: 35.0,)
                            ],
                          ),

                          const ResearchExp(endDate: 'July 2019', startDate: 'May 2019', percentage: 45, company: 'Ingelt Pvt Ltd', topic: 'Marketing Research',),
                          const ResearchExp(endDate: 'July 2019', startDate: 'May 2019', percentage: 45, company: 'Ingelt Pvt Ltd', topic: 'Marketing Research',),
                          const ResearchExp(endDate: 'July 2019', startDate: 'May 2019', percentage: 45, company: 'Ingelt Pvt Ltd', topic: 'Marketing Research',),
                          const ResearchExp(endDate: 'July 2019', startDate: 'May 2019', percentage: 45, company: 'Ingelt Pvt Ltd', topic: 'Marketing Research',),
                          const ResearchExp(endDate: 'July 2019', startDate: 'May 2019', percentage: 45, company: 'Ingelt Pvt Ltd', topic: 'Marketing Research',),

                        ],
                      ),
                    ),
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
        },
      ),
    );
  }


}