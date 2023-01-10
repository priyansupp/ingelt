import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_event.dart';
import 'package:ingelt/screens/group_page/group_chat.dart';
import '../../business_logic/blocs/group_state.dart';
import '../../data/models/group_model.dart';
import '../../data/models/profile_model.dart';
import '../../shared/widgets/circular_pic.dart';
import 'package:ingelt/shared/constants.dart';

class AllyReqGroup extends StatefulWidget {
  final GroupModel groupModel;
  final bool isAlly;
  const AllyReqGroup({Key? key, required this.isAlly, required this.groupModel}) : super(key: key);

  @override
  State<AllyReqGroup> createState() => _AllyReqGroupState();
}
final ProfileModel userrrrr = ProfileModel(uid: '0', name: 'Priyanshu', photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in');

class _AllyReqGroupState extends State<AllyReqGroup> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.isAlly) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupChat(user: userrrrr)));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        // width: MediaQuery.of(context).size.width*0.8,
        height: 180.0,
        decoration: BoxDecoration(
          color: AppThemeData.primaryAppColor,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
                children: [
                  Container(
                    height: 120.0,
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppThemeData.secondaryAppColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(17.0),
                          bottomRight: Radius.circular(17.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(width: 7.0,),
                        Transform.scale(scale: 1.2, child: const CircularPic()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.65,
                              child: Text(
                                // 'Marketing Elites Association',
                                widget.groupModel.grpName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    letterSpacing: 0.5
                                ),
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.65,
                              child: Text(
                                // 'Capitalise skills and take a mover advantage in the opening fields of science...',
                                widget.groupModel.description,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    letterSpacing: 0.5
                                ),
                                maxLines: 2,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 10.0,
                    left: 20.0,
                    child: Row(
                      children: [
                        Stack(
                          fit: StackFit.passthrough,
                          children: const [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/person.jpg'
                              ),
                              radius: 18.0,
                            ),
                            SizedBox(width: 70.0,),
                            Positioned(
                              left: 15.0,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/person.jpg'
                                ),
                                radius: 18.0,
                              ),
                            ),
                            Positioned(
                              left: 30.0,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/person.jpg'
                                ),
                                radius: 18.0,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          '${widget.groupModel.participants.length} joined',
                          style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    right: 17.0,
                    bottom: 46.0,
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                9.0)),
                            color: Colors.white
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 7.0),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.groupModel.date,
                              style: TextStyle(
                                  color: AppThemeData.blackishTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0
                              ),
                            ),
                            Text(
                              ' | ',
                              style: TextStyle(
                                  color: AppThemeData.blackishTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0
                              ),
                            ),
                            Text(
                              widget.groupModel.time,
                              style: TextStyle(
                                  color: AppThemeData.blackishTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0
                              ),
                            )
                          ],
                        )
                    ),
                  )
                ],
              ),
        )
      );
  }
}

