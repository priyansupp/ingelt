import 'package:flutter/material.dart';
import 'package:ingelt/shared/constants.dart';

class GroupGoals extends StatefulWidget {
  final int growthCount;
  const GroupGoals({Key? key, required this.growthCount}) : super(key: key);

  @override
  State<GroupGoals> createState() => _GroupGoalsState();
}

class _GroupGoalsState extends State<GroupGoals> {

  List<bool> growthFlag = [false, false, false, false, false, false];
  List<String> growthTopics = ['Concept', 'Business Model', 'Revenue Model', 'Product', 'Launch Strategy', 'Marketing Strategy'];


  @override
  Widget build(BuildContext context) {

    for(var i = 0; i < 6; i++) {
      if(i < widget.growthCount) {
        growthFlag[i] = true;
      }
    }

    return
      // the vertical dots are one column and the names are other
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,    // so that the both columns as whole lies in center
        children: [
          Transform.scale(
            scale: 0.9,
            child: SizedBox(
              height: 220.0,
              width: 20.0,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,    // to place the dot and vertical line in center
                    children: [
                      growthFlag[index] ? CircleAvatar(
                        backgroundColor: AppThemeData.primaryAppColor,
                        radius: 9.0,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 8.0,
                            child: Icon(
                              Icons.circle,
                              color: AppThemeData.primaryAppColor,
                              size: 15.0,
                            )
                        ),
                      ) : Icon(
                        Icons.circle,
                        color: AppThemeData.blackishTextColor,
                        size: 17.5,
                      ),
                      index != 5 ? const Text(
                        '|',
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                      ) : const SizedBox.shrink()
                    ],
                  );
                },
              ),
            ),
          ),

          // const SizedBox(width: 3.0,),

          Transform.scale(
            scale: 0.9,
            child: Container(
              // color: Colors.blue,
              height: 230.0,
              width: MediaQuery.of(context).size.width - 100,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  Color bgColor = growthFlag[index] ? AppThemeData.primaryAppColor : AppThemeData.lightGreyBgColor;
                  Color textColor = growthFlag[index] ? Colors.white : AppThemeData.blackishTextColor;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: 190.0,
                        height: 27.0,

                        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                            color: bgColor,
                        ),
                        child: Text(
                          growthTopics[index],
                          style: TextStyle(
                              fontSize: 16.0,
                              color: textColor,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      index != 5 ? const SizedBox(height: 13.5,) : const SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );
  }
}
