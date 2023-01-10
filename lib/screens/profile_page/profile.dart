import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/profile_event.dart';
import 'package:ingelt/business_logic/blocs/user_data_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_data_event.dart';
import 'package:ingelt/data/models/message_model.dart';
import 'package:ingelt/data/models/profile_model.dart';
import 'package:ingelt/data/models/user_data_model.dart';
import 'package:ingelt/data/repositories/profile_repo.dart';
import 'package:ingelt/screens/profile_page/edit_profile.dart';
import 'package:ingelt/screens/profile_page/research_exp.dart';
import 'package:ingelt/screens/profile_page/forte_bar.dart';
import 'package:ingelt/shared/widgets/rating.dart';
import '../../business_logic/blocs/profile_bloc.dart';
import '../../business_logic/blocs/profile_state.dart';
import '../../business_logic/blocs/user_data_state.dart';
import 'featured.dart';
import 'package:ingelt/shared/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final currentUser = FirebaseAuth.instance.currentUser!;   // user can be signed in from google or by mail
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _workingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _workingController.dispose();
    super.dispose();
  }

  int rating = 75;

  @override
  void initState() {
    // TODO: implement initState
    print(currentUser.uid);
    context.read<ProfileBloc>().add(GetProfileEvent(uid: currentUser.uid));
    context.read<UserDataBloc>().add(SetForteEvent(forte: const [60, 30, 70]));
    context.read<UserDataBloc>().add(GetUserDataEvent(uid: currentUser.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
              backgroundColor: AppThemeData.lightGreyBgColor,
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
                            height: 185.0,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.blue,
                            child: BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if (state is ProfileLoadedState) {
                                print("Loaded profile");
                                // ProfileModel? profileModel = state.profileModel;
                                ProfileModel? profileModel = state.profileModel;
                                String imageLink = "assets/bgImages/img";
                                if(profileModel?.skill == "Skill 1") {
                                  imageLink += "1.jpg";
                                } else if(profileModel?.skill == "Skill 2") {
                                  imageLink += "2.jpg";
                                } else if(profileModel?.skill == "Skill 3") {
                                  imageLink += "3.jpg";
                                } else if(profileModel?.skill == "Skill 4") {
                                  imageLink += "4.jpg";
                                } else if(profileModel?.skill == "Skill 5") {
                                  imageLink += "5.jpg";
                                } else {
                                  imageLink += "0.jpg";
                                }
                                print(imageLink);

                                return Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 120.0,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              imageLink,
                                            ),
                                            opacity: 1,
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 60.0,
                                        left: 18.0,
                                        child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 60.0,
                                                  child: profileModel!
                                                      .photoURL != null ?
                                                  ClipOval(
                                                    child: Image.network(
                                                      profileModel.photoURL!,
                                                      width: 115.0,
                                                      height: 115.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                      :
                                                  // const SizedBox.shrink()
                                                  Icon(
                                                    Icons.photo_camera,
                                                    color: AppThemeData
                                                        .blackishTextColor,
                                                    size: 70.0,
                                                  ),
                                                )
                                        ),

                                    Positioned(
                                      left: 125.0,
                                      top: 145.0,
                                      child: rating >= 95
                                          ? const Icon(
                                        Icons.verified, color: Colors.blue,)
                                          : Transform.scale(scale: 0.6,
                                          child: Rating(percentage: rating)),
                                    ),

                                    Positioned(
                                        top: 120.0,
                                        right: 10.0,
                                        child: IconButton(
                                          icon: const Icon(Icons.settings),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                builder: (
                                                    context) => const EditProfile()))
                                                .then((value) =>
                                            {
                                              context.read<ProfileBloc>().add(
                                                  GetProfileEvent(
                                                      uid: currentUser.uid)),
                                              // context.read<UserDataBloc>().add(GetUserDataEvent(uid: currentUser.uid)),
                                            });
                                          },
                                          iconSize: 28.0,
                                        )
                                    )
                                  ],
                                );
                            } else
                            if (state is ProfileLoadingState) {
                              print("Loading profile");
                              return const CircularProgressIndicator();
                              } else
                              if (state is ProfileErrorState) {
                              print(
                              "Error in loading profile");
                              return Center(
                              child: Text(state.error),);
                              } else {
                              return const Center(child: Text(
                              "Some error occurred1"),);
                              }
                            }
                            ),
                          ),
                          BlocBuilder<ProfileBloc, ProfileState>(
                            builder: (context, state) {
                              if(state is ProfileLoadedState) {
                                ProfileModel? profileModel = state
                                    .profileModel;
                                return Container(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        '${profileModel?.name}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppThemeData
                                                .blackishTextColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      profileModel?.company != null ? Text(
                                        '${profileModel?.designation}: ${profileModel?.company}',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: AppThemeData.blackishTextColor,
                                        ),
                                      ) : const SizedBox.shrink(),
                                      const SizedBox(height: 5.0,),
                                      profileModel?.university != null ? Text(
                                        // without inverted commas, we have to check for null values.
                                        '${profileModel?.university}',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: AppThemeData
                                                .blackishTextColor,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ) : const SizedBox.shrink(),
                                      profileModel?.location != null ? Text(
                                        '${profileModel?.location!}',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          color: AppThemeData.blackishTextColor,
                                        ),
                                      ) : const SizedBox.shrink(),
                                      // Row(
                                      //   crossAxisAlignment: CrossAxisAlignment
                                      //       .center,
                                      //   mainAxisAlignment: MainAxisAlignment
                                      //       .start,
                                      //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      //   children: [
                                      //     ElevatedButton(
                                      //       onPressed: () {},
                                      //       style: ElevatedButton.styleFrom(
                                      //           foregroundColor: Colors.white,
                                      //           backgroundColor: AppThemeData.primaryAppColor,
                                      //           minimumSize: Size(MediaQuery
                                      //               .of(context)
                                      //               .size
                                      //               .width * 0.35, 32.0),
                                      //           shape: const StadiumBorder()
                                      //       ),
                                      //       child: const Text(
                                      //         'Connect',
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.w600,
                                      //             letterSpacing: 1.0,
                                      //             fontSize: 16.0
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     const SizedBox(width: 10.0,),
                                      //     OutlinedButton(
                                      //       onPressed: () {},
                                      //       style: OutlinedButton.styleFrom(
                                      //           foregroundColor: AppThemeData
                                      //               .secondaryAppColor,
                                      //           minimumSize: Size(MediaQuery
                                      //               .of(context)
                                      //               .size
                                      //               .width * 0.35, 32.0),
                                      //           side: BorderSide(
                                      //             color: AppThemeData
                                      //                 .secondaryAppColor,
                                      //           ),
                                      //           shape: const StadiumBorder() // creates rounded borders
                                      //       ),
                                      //       child: const Text(
                                      //         'Message',
                                      //         style: TextStyle(
                                      //             fontWeight: FontWeight.w600,
                                      //             letterSpacing: 1.0,
                                      //             fontSize: 16.0
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     const SizedBox(width: 10.0,),
                                      //     Container(
                                      //       height: 32.0,
                                      //       width: MediaQuery
                                      //           .of(context)
                                      //           .size
                                      //           .width * 0.15,
                                      //       decoration: BoxDecoration(
                                      //         border: Border.all(width: 1.0,
                                      //           color: AppThemeData
                                      //               .secondaryAppColor,),
                                      //         borderRadius: const BorderRadius
                                      //             .all(
                                      //             Radius.elliptical(
                                      //                 30.0, 30.0)),
                                      //       ),
                                      //       child: IconButton(
                                      //         onPressed: () {},
                                      //         icon: const Icon(
                                      //             Icons.more_horiz_rounded),
                                      //         color: AppThemeData
                                      //             .secondaryAppColor,
                                      //         iconSize: 23.0,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                );
                              } else if (state is ProfileLoadingState) {
                                return const CircularProgressIndicator();
                              } else {
                                return const Center(child: Text("Some error occurred"),);
                              }
                            }
                          ),
                          const SizedBox(height: 4.0,),
                        ],
                      ),
                    ),

                    const SizedBox(height: 7.0,),

                    // Research Area container
                    Container(
                          color: Colors.white,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: const EdgeInsets.only(
                              // left: 20.0, top: 10.0, bottom: 15.0
                              left: 20.0, top: 10.0, bottom: 10.0, right: 10.0
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    'FORTE',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.5,
                                      color: AppThemeData.blackishTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              BlocBuilder<UserDataBloc, UserDataState>(
                                builder: (context, state) {
                                  if(state is UserDataLoadedState) {
                                    UserDataModel? userDataModel = state
                                        .userDataModel;
                                    return userDataModel?.forte != null
                                        ? Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [

                                        const SizedBox(height: 10.0,),
                                        ForteBar(
                                          text: 'GRAPHIC DESIGN',
                                          percentage: userDataModel!.forte![0],),
                                        const SizedBox(height: 12.0,),
                                        ForteBar(
                                          text: 'MARKETING',
                                          percentage: userDataModel.forte![1],),
                                        const SizedBox(height: 12.0,),
                                        ForteBar(
                                          text: 'FINANCE',
                                          percentage: userDataModel.forte![2],),

                                      ],
                                    )
                                        : const SizedBox.shrink();
                                  } else if(state is UserDataLoadingState) {
                                    return const CircularProgressIndicator();
                                  } else if(state is UserDataErrorState) {
                                    return Center(child: Text(state.error),);
                                  }
                                  else {
                                    return const Center(child: Text("Some1 error occurred"),);
                                  }
                                }
                              ),
                            ],
                          ),
                        ),

                    const SizedBox(height: 7.0,),

                    // Working container(BlocBuilder wrapped around only the textbox).
                    Container(
                          color: Colors.white,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 0.0, bottom: 10.0, right: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    'WORKING',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.5,
                                      color: AppThemeData.blackishTextColor,
                                    ),
                                  ),
                                  IconButton(onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Stack(
                                          clipBehavior: Clip.none,
                                          children: <Widget>[
                                            // Positioned(
                                            //   right: -40.0,
                                            //   top: -40.0,
                                            //   child: InkResponse(
                                            //     onTap: () {
                                            //       Navigator.of(context).pop();
                                            //     },
                                            //     child: CircleAvatar(
                                            //       child: Icon(Icons.close),
                                            //       backgroundColor: Colors.red,
                                            //     ),
                                            //   ),
                                            // ),
                                            Form(
                                              key: _formKey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                      controller: _workingController,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: ElevatedButton(
                                                      child: Text("Submit"),
                                                      onPressed: () {
                                                        if (_formKey.currentState!.validate()) {
                                                          _formKey.currentState!.save();
                                                          // print(_workingController.text.trim());
                                                          context.read<UserDataBloc>().add(SetWorkingEvent(working: _workingController.text.trim().toString()));
                                                        }
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                    icon: const Icon(Icons.more_horiz_rounded),
                                    iconSize: 35.0,)
                                ],
                              ),
                              BlocBuilder<UserDataBloc, UserDataState>(
                                builder: (context, state) {
                                  if(state is UserDataLoadedState) {
                                    UserDataModel? userDataModel = state
                                        .userDataModel;
                                    print(userDataModel);
                                    return userDataModel?.working != null ? Text(
                                      userDataModel!.working!,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          color: AppThemeData.blackishTextColor,
                                          overflow: TextOverflow.ellipsis
                                      ),
                                      maxLines: 5,
                                    ) : const SizedBox.shrink();
                                  } else if(state is UserDataLoadingState) {
                                    return const CircularProgressIndicator();
                                  } else if(state is UserDataErrorState) {
                                    return Center(child: Text(state.error),);
                                  }
                                  else {
                                    return const Center(child: Text("Some2 error occurred"),);
                                  }

                                }
                              )
                            ],
                          ),
                        ),

                    const SizedBox(height: 7.0,),

                    // Featured container(BlocBuilder wrapped around only the row element).
                    Container(
                          color: Colors.white,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      'FEATURED',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.5,
                                        color: AppThemeData.blackishTextColor,
                                      ),
                                    ),
                                    IconButton(onPressed: () {},
                                      icon: const Icon(
                                          Icons.more_horiz_rounded),
                                      iconSize: 25.0,)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 310.0, // to fix the width of each item(of the container)
                                child: BlocBuilder<UserDataBloc, UserDataState>(
                                  builder: (context, state) {
                                    if(state is UserDataLoadedState) {
                                      UserDataModel? userDataModel = state
                                          .userDataModel;
                                      return userDataModel?.featured != null ? ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Featured(text: userDataModel!.featured?[index][0], photoURL: userDataModel.featured![index][1],);
                                        },
                                        itemCount: userDataModel!.featured?.length,
                                      ) : const SizedBox.shrink();
                                    } else if(state is UserDataLoadingState) {
                                      return const CircularProgressIndicator();
                                    } else if(state is UserDataErrorState) {
                                      return Center(child: Text(state.error),);
                                    }
                                    else {
                                      return const Center(child: Text("Some3 error occurred"),);
                                    }

                                  }
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
                              Text(
                                'RESEARCH EXPERIENCE',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.5,
                                    color: AppThemeData.blackishTextColor,
                                ),
                              ),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded), iconSize: 35.0,)
                            ],
                          ),

                          // ListView.builder(
                          //   scrollDirection: Axis.vertical,
                          //   itemBuilder: (context, index) {
                          //     return Text('helll');
                          //   },
                          //   itemCount: 5,
                          // ),

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
            ),
          );
    }
}