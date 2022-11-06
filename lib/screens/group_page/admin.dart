import 'package:flutter/material.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';
import 'package:ingelt/shared/widgets/group_goals.dart';
import 'package:ingelt/shared/constants.dart';
import '../home_page/vertical_groups.dart';
import 'create_group.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  bool adminGroupCreated = true;


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
            adminGroupCreated == true ? Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Growth Goals',
                      style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.w600,
                          color: AppThemeData.blackishTextColor,
                        letterSpacing: 1.0
                      ),
                    ),
                    Text(
                      'Today | 18:00',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: AppThemeData.blackishTextColor,
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

                Text(
                  'brebv eic eiv efhekr vervruif ewkf ewfe wkf iewf euwif ewiuf ewubfuiwbfiu wiu wui dwueib briurew ruirwb3 o3  weiub aneoi 3e9h3ih3ir38yrhyowye i3.',
                  style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: AppThemeData.blackishTextColor,
                      overflow: TextOverflow.ellipsis,
                      height: 1.2   // controls line height
                  ),
                  maxLines: 4,
                ),

                // const SizedBox(height: 10.0,),

                const GroupGoals(growthCount: 4,),

                Text(
                  'Spotlight',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: AppThemeData.blackishTextColor,
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
          ) : Container(
            height: 470.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40.0,),
                const Text(
                  'Make Your Own Niche',
                  style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.black54,
                      fontWeight: FontWeight.w300
                  ),
                ),
                const SizedBox(height: 20.0,),
                SizedBox(
                  height: 40.0,
                  width: 130.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder()
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Wrap(    // to control height of the modalsheetbottom(according to its content)
                            children: const [
                              CreateGroup(),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Create',
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
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
                    Text(
                      'Accomplishments',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: AppThemeData.blackishTextColor,
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
