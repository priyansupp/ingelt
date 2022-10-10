import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  int percentage = 40;

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
                          Container(
                            height: 185.0,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.blue,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 120.0,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.red,
                                ),
                                Positioned(
                                    top: 60.0,
                                    left: 18.0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 60.0,
                                      child: user!.photoURL != null ?
                                      ClipOval(
                                        child: Image.network(
                                          user.photoURL!,
                                          width: 115.0,
                                          height: 115.0,
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

                                const Positioned(
                                  left: 125.0,
                                  top: 145.0,
                                  child: Icon(Icons.verified, color: Colors.blue,),
                                ),

                                Positioned(
                                  top: 120.0,
                                  right: 10.0,
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
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Text(
                                  'Co-founder: Ingelt',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5.0,),
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
                                    fontSize: 11.0,
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
                                // const SizedBox(height: 8.0,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary: Theme.of(context).colorScheme.secondary,
                                          minimumSize: Size(MediaQuery.of(context).size.width * 0.35, 32.0),
                                          shape: const StadiumBorder()
                                      ),
                                      child: const Text(
                                          'Connect',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.0,
                                          fontSize: 16.0
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),
                                    OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                          primary: Theme.of(context).colorScheme.secondary,
                                          minimumSize: Size(MediaQuery.of(context).size.width * 0.35, 32.0),
                                          side: BorderSide(
                                            color: Theme.of(context).colorScheme.secondary,
                                          ),
                                          shape: const StadiumBorder()        // creates rounded borders
                                      ),
                                      child: const Text(
                                          'Message',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.0,
                                            fontSize: 16.0
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),
                                    Container(
                                      height: 32.0,
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
                          const SizedBox(height: 4.0,),
                        ],
                      ),
                    ),

                    const SizedBox(height: 7.0,),

                    // Research Area container
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'FORTE',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                                color: Colors.black
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          ResearchBar(text: 'GRAPHIC DESIGN', percentage: 40,),
                          SizedBox(height: 12.0,),
                          ResearchBar(text: 'MARKETING', percentage: 60,),
                          SizedBox(height: 12.0,),
                          ResearchBar(text: 'FINANCE', percentage: 80,),

                        ],
                      ),
                    ),

                    const SizedBox(height: 7.0,),

                    // Working container
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20.0, top: 0.0, bottom: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'WORKING',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
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
                                color: Colors.black,
                              overflow: TextOverflow.ellipsis
                            ),
                            maxLines: 5,
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 7.0,),

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
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.5,
                                      color: Colors.black
                                  ),
                                ),
                                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded), iconSize: 25.0,)
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

                    const SizedBox(height: 7.0,),

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
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
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