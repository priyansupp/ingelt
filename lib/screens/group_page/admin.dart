import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_event.dart';
import 'package:ingelt/business_logic/blocs/group_state.dart';
import 'package:ingelt/business_logic/blocs/previous_groups_bloc.dart';
import 'package:ingelt/business_logic/blocs/previous_groups_state.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_event.dart';
import 'package:ingelt/data/models/user_grpdata_model.dart';
import 'package:ingelt/shared/widgets/circular_pic.dart';
import 'package:ingelt/shared/widgets/group_goals.dart';
import 'package:ingelt/shared/constants.dart';
import '../../business_logic/blocs/previous_groups_event.dart';
import '../../business_logic/blocs/user_grpdata_state.dart';
import '../../data/models/group_model.dart';
import '../home_page/vertical_groups.dart';
import 'create_group.dart';

class Admin extends StatefulWidget {
  // final UserGrpDataModel? userGrpDataModel;
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {


  final currentUser = FirebaseAuth.instance.currentUser!;
  bool adminGroupExists = false;

  @override
  void initState() {
    // TODO: implement initState
    // if (widget.userGrpDataModel != null) {
    //   if (widget.userGrpDataModel?.adminGrpId != null &&
    //       widget.userGrpDataModel?.adminGrpId != "") {
    //     setState(() {
    //       adminGroupExists = true;
    //     });
    //     context.read<GroupBloc>().add(
    //         GetGroupDetailsEvent(grpId: widget.userGrpDataModel!.adminGrpId!));
    //   }
    // }
    context.read<UserGrpDataBloc>().add(GetUserGrpDataEvent(uid: currentUser.uid));
    context.read<PreviousGroupsBloc>().add(GetPreviousGroupsListEvent(uid: currentUser.uid));

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // print("abracadara");

    return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // adminGroupExists != false ?
                    BlocBuilder<UserGrpDataBloc, UserGrpDataState>(
                        builder: (context, state1) {
                          if (state1 is UserGrpDataLoadedState) {
                            UserGrpDataModel? userGrpDataModel = state1.userGrpDataModel;
                            if(userGrpDataModel != null) {
                              if(userGrpDataModel.adminGrpId != null && userGrpDataModel.adminGrpId != "") {
                                context.read<GroupBloc>().add(GetGroupDetailsEvent(grpId: userGrpDataModel.adminGrpId!));
                              }
                              // if(userGrpDataModel.previousGroups != null && userGrpDataModel.previousGroups != []) {
                              //   context.read<UserGrpDataBloc>().add(GetPreviousGroupsListEvent(uid: currentUser.uid));
                              // }
                            }
                            return userGrpDataModel?.adminGrpId != null && userGrpDataModel?.adminGrpId != "" ?
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                              child: BlocBuilder<GroupBloc, GroupState>(
                                  builder: (context, state) {
                                    if (state is GroupLoadedState) {
                                      GroupModel? grpModel = state.groupModel;
                                      // print("erf");
                                      // print(grpModel?.category);
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                // 'Growth Goals',
                                                grpModel!.grpName,
                                                style: TextStyle(
                                                    fontSize: 27.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppThemeData
                                                        .blackishTextColor,
                                                    letterSpacing: 1.0
                                                ),
                                              ),
                                              Text(
                                                // 'Today | 18:00',
                                                grpModel.time,
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
                                            // 'brebv eic eiv efhekr vervruif ewkf ewfe wkf iewf euwif ewiuf ewubfuiwbfiu wiu wui dwueib briurew ruirwb3 o3  weiub aneoi 3e9h3ih3ir38yrhyowye i3.',
                                            grpModel.description,
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: AppThemeData.blackishTextColor,
                                                overflow: TextOverflow.ellipsis,
                                                height: 1.2 // controls line height
                                            ),
                                            maxLines: 4,
                                          ),

                                          // const SizedBox(height: 10.0,),

                                          GroupGoals(growthCount: grpModel.level,),

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
                                              itemBuilder: (BuildContext context,
                                                  int index) {
                                                // TODO: complete the participants page
                                                return ShowActive(
                                                  userId: grpModel
                                                      .participants[index],);
                                              },
                                              itemCount: grpModel.participants.length,

                                            ),
                                          ),

                                          const SizedBox(height: 2.0,),
                                        ],
                                      );
                                    } else if (state is GroupLoadingState) {
                                      return const CircularProgressIndicator();
                                    } else if (state is GroupErrorState) {
                                      return Center(child: Text(state.error),);
                                    } else {
                                      return const Center(
                                        child: Text("Some error occurred"),);
                                    }
                                  }
                              ),
                            )
                                :
                            Container(
                              height: 470.0,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
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
                                        shape: const StadiumBorder(),
                                        backgroundColor: AppThemeData.secondaryAppColor,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Wrap( // to control height of the modalsheetbottom(according to its content)
                                              children: const [
                                                CreateGroup(),
                                              ],
                                            );
                                          },
                                        ).whenComplete(() =>
                                        {
                                          context.read<UserGrpDataBloc>().add(
                                              GetUserGrpDataEvent(
                                                  uid: currentUser.uid)),
                                        });
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
                            );
                          } else if (state1 is UserGrpDataLoadingState) {
                            return const CircularProgressIndicator();
                          } else if (state1 is UserGrpDataErrorState) {
                            return Center(child: Text(state1.error),);
                          } else {
                            return const Text("Hellp");
                          }
                        }
                    ),

                    const SizedBox(height: 7.0,),
                    // greyish gap in between Active and Previous Groups

                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 15.0, 0.0),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
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
                              IconButton(
                                  onPressed: () {}, icon: const Icon(
                                  Icons.search))
                            ],
                          ),

                          SizedBox(
                            // color: Colors.blue,
                            height: 180.0,
                            child: BlocBuilder<PreviousGroupsBloc,
                                PreviousGroupsState>(
                                builder: (context, state) {
                                  if (state is PreviousGroupsLoadedState) {
                                    List<GroupModel> previousGroups = state
                                        .previousGroups;
                                    print(previousGroups);
                                    print(previousGroups[0].category);
                                    return ListView.builder(
                                      // padding: const EdgeInsets.symmetric(horizontal: 10.0),     // gives padding to the list not the items
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Transform.scale(scaleX: 0.75,
                                                scaleY: 0.9,
                                                alignment: Alignment.centerLeft,
                                                child: VerGroup(
                                                  // date: '22nd July 2022', desc: "Ather's smart electric scooters with best-in-class settings to deal with.", category: 'Automobile', admin: 'Priyanshu Jaiswal', adminDesc: 'An aspiring app developer, and a web developer in making',
                                                  onHomePage: false,
                                                  grpModel: previousGroups[index],
                                                )),
                                            // SizedBox(width: 10.0,),
                                          ],
                                        );
                                      },
                                      itemCount: previousGroups.length,
                                    );
                                  } else if (state is PreviousGrpDataErrorState) {
                                    return Center(child: Text(state.error),);
                                  } else if (state is PreviousGrpDataLoadingState) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    print("hvvb ${state}");
                                    // print("hvvb2 ${state}")
                                    return const Center(
                                      child: Text("Some3 error occurred"),);
                                  }
                                }
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
            );
          }
        }

class ShowActive extends StatelessWidget {
  final String userId;
  const ShowActive({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // print("active");

    return Row(
      children: const [
        CircularPic(),
        SizedBox(width: 10.0,),
      ],
    );
  }
}
