import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_event.dart';
import 'package:ingelt/data/models/profile_model.dart';
import 'package:ingelt/shared/constants.dart';

import '../../business_logic/blocs/user_data_bloc.dart';
import '../../business_logic/blocs/user_data_event.dart';
import '../../business_logic/blocs/user_data_state.dart';
import '../../business_logic/blocs/user_grpdata_state.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserGrpDataBloc>().add(GetRequestsFromEvent(uid: currentUser.uid));
    context.read<UserDataBloc>().add(GetConnectionsRequestedFromEvent(uid: currentUser.uid));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 7.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/home_title_bg.jpg',
                  ),
                  opacity: 0.20,
                  fit: BoxFit.cover
              )
          ),
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  width: 100.0,
                  height: 60.0,
                  image: const AssetImage(
                      'assets/ingelt-logo.png'
                  ),
                  fit: BoxFit.fill,
                  color: AppThemeData.blackishTextColor
                ),
                const SizedBox(height: 10.0,),
                Text(
                  ' Notifications',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: -0.01,
                    color: AppThemeData.blackishTextColor,
                    letterSpacing: 1
                  ),
                ),
              ],
            ),
          ),
        ),

        BlocBuilder<UserGrpDataBloc, UserGrpDataState>(
          builder: (context, state) {
            if(state is RequestsFromLoaded) {
              List<ProfileModel>? requestedProfiles = state.requestedProfiles;
              if(requestedProfiles!.isEmpty) return const SizedBox.shrink();
              return Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      print(requestedProfiles[index].uid);
                      return Column(
                        children: [
                          GroupNotif(profile: requestedProfiles[index]),
                          const Divider()
                        ],
                      );
                    },

                    itemCount: requestedProfiles.length,
                  ),
                ),
              );
            } else if (state is UserGrpDataErrorState) {
              return Text(state.error);
            } else if(state is UserGrpDataLoadingState) {
              return const CircularProgressIndicator();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),



        BlocBuilder<UserDataBloc, UserDataState>(
          builder: (context, state) {
            if(state is ConnectionsRequestedFromLoaded) {
              List<ProfileModel>? connectionsRequestedFrom = state.connectionsRequestedFrom;
              if(connectionsRequestedFrom!.isEmpty) return const SizedBox.shrink();
              return Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      print(connectionsRequestedFrom[index].uid);
                      return Column(
                        children: [
                          ConnectionNotif(profile: connectionsRequestedFrom[index]),
                          const Divider()
                        ],
                      );
                    },

                    itemCount: connectionsRequestedFrom.length,
                  ),
                ),
              );
            } else if (state is UserDataErrorState) {
              return Text(state.error);
            } else if(state is UserDataLoadingState) {
              return const CircularProgressIndicator();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),

      ],
    );
  }
}

class GroupNotif extends StatefulWidget {
  final ProfileModel profile;
  const GroupNotif({Key? key, required this.profile}) : super(key: key);

  @override
  State<GroupNotif> createState() => _GroupNotifState();
}

class _GroupNotifState extends State<GroupNotif> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 7.5, 15.0, 7.5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
                widget.profile.photoURL == null ? const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/analytics.jpg',
                ),
                radius: 25,
              ) : CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.profile.photoURL!
                    ),
                  radius: 25,
                ),

              const SizedBox(width: 10.0,),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.profile.name}',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppThemeData.primaryAppColor
                        ),
                      ),

                      const SizedBox(width: 4.0,),

                      Text(
                        'has requested to join your group',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppThemeData.blackishTextColor,
                            overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {
                        // add this user in the admin's created group and remove from currentUser's requestsFrom.
                        // also add the currentUser's admin grpId to this profile's allies group and remove from requestedTo list.
                      }, child: const Text("Accept")),
                      TextButton(onPressed: () {
                        // remove from currentUser's requestsFrom.
                        // remove from requestedTo list
                      }, child: const Text("Decline")),
                    ],
                  )
                ],
              )



            ],
          ),


        ],
      ),

    );
  }
}



class ConnectionNotif extends StatefulWidget {
  final ProfileModel profile;
  const ConnectionNotif({Key? key, required this.profile}) : super(key: key);

  @override
  State<ConnectionNotif> createState() => _ConnectionNotifState();
}

class _ConnectionNotifState extends State<ConnectionNotif> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 7.5, 15.0, 7.5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            children: [
              widget.profile.photoURL == null ? const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/analytics.jpg',
                ),
                radius: 25,
              ) : CircleAvatar(
                backgroundImage: NetworkImage(
                    widget.profile.photoURL!
                ),
                radius: 25,
              ),

              const SizedBox(width: 10.0,),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.profile.name}',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppThemeData.primaryAppColor
                        ),
                      ),

                      const SizedBox(width: 4.0,),

                      Text(
                        'wants to connect with you',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppThemeData.blackishTextColor,
                            overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {
                        // add this user in the currentUser's connections and remove from currentUser's requestedFrom.
                      }, child: const Text("Accept")),
                      TextButton(onPressed: () {
                        // remove from currentUser's requestedFrom.
                      }, child: const Text("Decline")),
                    ],
                  )
                ],
              )



            ],
          ),


        ],
      ),

    );
  }
}

