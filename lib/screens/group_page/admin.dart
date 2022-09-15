import 'package:flutter/material.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';

import '../home_page/vertical_groups.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  int growthCount = 4;
  List<bool> growthFlag = [false, false, false, false, false, false];
  List<String> growthTopics = ['Concept', 'Business Model', 'Revenue Model', 'Product', 'Launch Strategy', 'Marketing Strategy'];




  @override
  Widget build(BuildContext context) {

    for(var i = 0; i < 6; i++) {
      if(i < growthCount) {
        growthFlag[i] = true;
      }
    }

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
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        letterSpacing: 1.0
                      ),
                    ),
                    Text(
                      'Today | 18:00',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
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

                const SizedBox(height: 5.0,),

                const Text(
                  ' brebv eic eiv efhekr vervruif ewkf ewfe wkf iewf euwif ewiuf ewubfuiwbfiu wiu wui dwueib briurew ruirwb3 o3  weiub aneoi 3e9h3ih3ir38yrhyowye i3.',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    overflow: TextOverflow.ellipsis,
                    height: 1.2   // controls line height
                  ),
                  maxLines: 7,
                ),

                const SizedBox(height: 15.0,),

                // the vertical dots are one column and the names are other
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,    // so that the both columns as whole lies in center
                  children: [
                    SizedBox(
                      height: 250.0,
                      width: 20.0,
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,    // to place the dot and vertical line in center
                            children: [
                              growthFlag[index] ? CircleAvatar(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                radius: 9.0,
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 8.0,
                                    child: Icon(
                                      Icons.circle,
                                      color: Theme.of(context).colorScheme.primary,
                                      size: 15.0,
                                    )
                                ),
                              ) : const Icon(
                                Icons.circle,
                                color: Colors.black,
                                size: 15.0,
                              ),
                              index != 5 ? const Text(
                                '|',
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              ) : const Text('')
                            ],
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12.0,),

                    SizedBox(
                      height: 260.0,
                      width: MediaQuery.of(context).size.width - 100,
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          Color bgColor = growthFlag[index] ? Theme.of(context).colorScheme.primary : Colors.grey;
                          Color textColor = growthFlag[index] ? Colors.white : Colors.black;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 190.0,
                                height: 27.0,
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.5),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                                    color: bgColor
                                ),
                                child: Text(
                                  growthTopics[index],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: textColor,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),

                              index != 5 ? const SizedBox(height: 13.5,) : const SizedBox.shrink(),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),

                // const SizedBox(height: 10.0,),

                const Text(
                  'Active',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1.0
                  ),
                ),

                SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                    // padding: const EdgeInsets.symmetric(horizontal: 10.0),     // gives padding to the list not the items
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const ShowActive();
                    },
                    itemCount: 10,

                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10.0,),    // greyish gap in between Active and Previous Groups

          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 0.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Previous Groups',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1.0
                  ),
                ),

                SizedBox(
                  height: 250.0,
                  child: ListView.builder(
                    // padding: const EdgeInsets.symmetric(horizontal: 10.0),     // gives padding to the list not the items
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(scale: 0.8, alignment: Alignment.centerLeft, child: const VerGroup(date: '22nd July 2022', desc: "Ather's smart electric scooters with best-in-class settings to deal with.", category: 'Automobile', admin: 'Priyanshu Jaiswal', adminDesc: 'An aspiring app developer, and a web developer in making')),
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

