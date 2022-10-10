import 'package:flutter/material.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';
import 'package:ingelt/shared/widgets/group_goals.dart';

import '../home_page/vertical_groups.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Growth Goals',
                      style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        letterSpacing: 1.0
                      ),
                    ),
                    Text(
                      'Today | 18:00',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.black
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 170.0,
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 2.0,),

                const Text(
                  'brebv eic eiv efhekr vervruif ewkf ewfe wkf iewf euwif ewiuf ewubfuiwbfiu wiu wui dwueib briurew ruirwb3 o3  weiub aneoi 3e9h3ih3ir38yrhyowye i3.',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    overflow: TextOverflow.ellipsis,
                    height: 1.2   // controls line height
                  ),
                  maxLines: 4,
                ),

                // const SizedBox(height: 10.0,),

                const GroupGoals(growthCount: 4,),



                const Text(
                  'Spotlight',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1.0
                  ),
                ),

                SizedBox(
                  // color: Colors.red,
                  height: 75.0,
                  child: ListView.builder(
                    // padding: const EdgeInsets.symmetric(horizontal: 10.0),     // gives padding to the list not the items
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const ShowActive();
                    },
                    itemCount: 10,

                  ),
                ),

                const SizedBox(height: 2.0,),
              ],
            ),
          ),

          const SizedBox(height: 7.0,),    // greyish gap in between Active and Previous Groups

          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 15.0, 0.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Accomplishments',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 1.0
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ],
                ),

                Container(
                  // color: Colors.blue,
                  height: 180.0,
                  child: ListView.builder(
                    // padding: const EdgeInsets.symmetric(horizontal: 10.0),     // gives padding to the list not the items
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(scaleX: 0.75, scaleY: 0.9, alignment: Alignment.centerLeft, child: const VerGroup(date: '22nd July 2022', desc: "Ather's smart electric scooters with best-in-class settings to deal with.", category: 'Automobile', admin: 'Priyanshu Jaiswal', adminDesc: 'An aspiring app developer, and a web developer in making', onHomePage: false,)),
                          // SizedBox(width: 10.0,),
                        ],
                      );
                    },
                    itemCount: 5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShowActive extends StatelessWidget {
  const ShowActive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircularPic(),
        SizedBox(width: 10.0,),
      ],
    );
  }
}

