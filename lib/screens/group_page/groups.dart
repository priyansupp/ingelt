import 'package:flutter/material.dart';
import 'package:ingelt/models/group_model.dart';
import 'package:ingelt/screens/group_page/group_chat.dart';


class Groups extends StatelessWidget {
  final int groupIndex;
  const Groups({Key? key, required this.groupIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final GroupModel group = groups[groupIndex];
    return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupChat(
                group: group,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0),),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(group.imageUrl),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          group.name,
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.45,
                        //   child: Text(
                        //     message.text,
                        //     style: TextStyle(
                        //       color: Colors.blueGrey,
                        //       fontSize: 15.0,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      group.time,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    // message.unread
                    //     ? Container(
                    //   width: 40.0,
                    //   height: 20.0,
                    //   decoration: BoxDecoration(
                    //     color: Theme.of(context).primaryColor,
                    //     borderRadius: BorderRadius.circular(30.0),
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     'NEW',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 12.0,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // )
                    //     : Text(''),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}