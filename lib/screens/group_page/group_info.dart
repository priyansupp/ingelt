import 'package:flutter/material.dart';
import 'package:ingelt/data/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingelt/shared/widgets/group_goals.dart';
import 'package:ingelt/shared/constants.dart';
import '../../shared/widgets/circular_pic.dart';

class GroupInfo extends StatefulWidget {
  const GroupInfo({Key? key}) : super(key: key);

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {

  final currentUser = FirebaseAuth.instance.currentUser!;   // user can be signed in from google or by mail

  // getting the user with its uid from firestore
  Future<ProfileModel?> readUser() async {
    final documentReference = FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
    final documentSnapshot = await documentReference.get();
    // print('hello fetching rn');
    if (documentSnapshot.exists) {
      // print(documentSnapshot.data());
      return ProfileModel.fromJson(documentSnapshot.data()!);
    } else {
      // print('could not fetch');
      return null;
    }
  }

  List<String>participants = ["Riya", "Tushar", "prem", "Bhadana", "Sumo", "Bikki", "noyo", "Siri kumari"];
  List<String>expertise = ["Bakchodi", "Bakwas", "RR", "Chutiyap", "Horny", "anger", "ML", "-ML"];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<ProfileModel?>(
        future: readUser(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final user = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.blue,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 120.0,
                            width: MediaQuery.of(context).size.width,

                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                opacity: 0.15,
                                image: AssetImage(
                                  'assets/home_title_bg.jpg',
                                ),
                                fit: BoxFit.cover,
                                // colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.lighten)
                              ),
                              color: Color(0x99D3D3D3),
                            ),

                          ),
                          Positioned(
                              top: 30.0,
                              left: 18.0,
                              child: ClipOval(
                                child: Image.network(
                                  user!.photoURL!,
                                  width: 115.0,
                                  height: 115.0,
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),

                          Positioned(
                            top: 50.0,
                            left: 140.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Growth Goals',
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                                  child: const Text(
                                    'Invite Researcher',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )


                        ],
                      ),
                    ),

                    const SizedBox(height: 10.0,),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Text(
                        'Individual development significant effect defining a clear plan to hope',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xEE5A5A5A),
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Color(0xFFD3D3D3),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                '13:00',
                                style: TextStyle(
                                  color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0
                                ),
                              ),
                              Text(
                                'Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.0,
                                    fontSize: 13.0
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(width: 10.0,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Color(0xFFD3D3D3),
                          ),
                          child: Column(
                            children: const [
                              Icon(
                                Icons.notifications,
                                color: Colors.black,
                                size: 25.0,
                              ),
                              Text(
                                'Notify',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.0,
                                    fontSize: 13.0
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0,),
                    const Divider(
                      thickness: 1.0,
                      color: Colors.black54,
                      endIndent: 10.0,
                      indent: 10.0,
                    ),

                    const SizedBox(height: 10.0,),

                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                        ),
                      ),
                    ),

                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color(0xFFD3D3D3),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                      child: const Text(
                        'Identifying areas for personal growth and defining a clear plan to hone them can have a significant effect on your career. These individual development are responsible for whatever tf happens in your fucking career.',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          letterSpacing: 0.5,
                          overflow: TextOverflow.ellipsis
                        ),
                        maxLines: 4,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: GroupGoals(growthCount: 4),
                    ),

                    const SizedBox(height: 10.0,),

                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Active',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        // color: Colors.red,
                        height: 75.0,
                        child: ListView.builder(
                          // padding: const EdgeInsets.symmetric(horizontal: 10.0),     // gives padding to the list not the items
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: const [
                                CircularPic(),
                                SizedBox(width: 10.0,),
                              ],
                            );
                          },
                          itemCount: 10,

                        ),
                      ),
                    ),

                    const SizedBox(height: 10.0,),

                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Participants',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),


                    Container(
                      height: 350.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color(0xFFD3D3D3),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 12.0),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 6.0,),
                              const CircleAvatar(
                                backgroundColor: Color(0xEE5A5A5A),
                                radius: 23.0,
                                child: Icon(
                                  Icons.add,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 17.0,),
                              Text(
                                'Add Participants',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: const Divider(
                              indent: 60.0,
                              thickness: 1.0,
                              color: Colors.black,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 6.0,),
                              const CircleAvatar(
                                backgroundColor: Color(0xEE5A5A5A),
                                radius: 23.0,
                                child: Icon(
                                  Icons.link_rounded,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 17.0,),
                              Text(
                                'Invite to Group via Link',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),

                          Expanded(
                            child: ListView.builder(
                              // itemExtent: 20.0,
                              scrollDirection: Axis.vertical,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Transform.scale(scale: 0.8, child: const CircularPic()),
                                    Positioned(
                                      left: 70.0,
                                      top: 0.0,
                                      bottom: 0.0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.8,
                                            child: const Divider(
                                              thickness: 1.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            participants[index],
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            expertise[index],
                                            style: const TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 5.0,),
                                        ],
                                      ),
                                    ),
                                    Positioned(right: 00.0, bottom: 0.0, top: 0.0, child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)))
                                  ],
                                );
                              }
                            ),
                          ),
                        ],
                      )
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
        }
      ),
    );
  }
}
