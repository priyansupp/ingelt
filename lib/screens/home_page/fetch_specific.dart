import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_event.dart';
import 'package:ingelt/business_logic/blocs/user_data_event.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_event.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_state.dart';
import 'package:ingelt/data/models/group_model.dart';
import 'package:ingelt/screens/home_page/vertical_groups.dart';

import '../../business_logic/blocs/group_state.dart';
import '../../business_logic/blocs/user_data_bloc.dart';
import '../../business_logic/blocs/user_data_state.dart';

class FetchSpecific extends StatefulWidget {
  const FetchSpecific({Key? key}) : super(key: key);

  @override
  State<FetchSpecific> createState() => _FetchSpecificState();
}

class _FetchSpecificState extends State<FetchSpecific> {

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserDataBloc>().add(GetUserDataEvent(uid: currentUser.uid));

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 5.0, right: 15.0, left: 15.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
          if(state is UserDataLoadedState) {
            if(state.userDataModel == null) {
              return const SizedBox.shrink();
            }
            final List<dynamic>? connections = state.userDataModel?.connections;

            return connections != null ? ListView.builder(
              itemBuilder: (context, index) {
                // display all those groups whose admins are connections of the currentUser.
                context.read<UserGrpDataBloc>().add(GetUserGrpDataEvent(uid: connections![index]));
                return BlocBuilder<UserGrpDataBloc, UserGrpDataState>(
                  builder: (context, state) {
                    if(state is UserGrpDataLoadedState) {

                      if(state.userGrpDataModel == null){
                        return const SizedBox.shrink();
                      }

                      if(state.userGrpDataModel!.adminGrpId == null) {
                        // connection isn't group admin of any group
                        return const SizedBox.shrink();
                      } else {
                        String? adminGrpId = state.userGrpDataModel!.adminGrpId;
                        context.read<GroupBloc>().add(GetGroupDetailsEvent(grpId: adminGrpId!));
                        return BlocBuilder<GroupBloc, GroupState>(
                          builder: (context, state) {
                            if(state is GroupLoadedState) {
                              GroupModel? groupModel = state.groupModel;
                              return VerGroup(
                                // date: '22nd July 2022',
                                // desc: "Ather's smart electric scooters with best-in-class settings to deal with.",
                                // category: 'Automobile',
                                // admin: 'Priyanshu Jaiswal',
                                // adminDesc: 'An aspiring app developer, and a web developer in making',
                                grpModel: groupModel,
                                onHomePage: true,);
                            } else if(state is GroupErrorState) {
                              return Center(child: Text(state.error),);
                            } else {
                              return const Center(child: Text("Some error occurred"),);
                            }
                          }
                        );
                      }
                    } else if(state is UserGrpDataErrorState) {
                      return Center(child: Text(state.error),);
                    } else {
                      return const Center(child: Text("Some error occurred"),);
                    }
                  },
                );
              },
              itemCount: 10,

            ) : const SizedBox.shrink();
          } else if (state is UserDataLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is UserDataErrorState) {
            return Center(child: Text(state.error),);
          } else {
            return const Center(child: Text("Some error occurred"),);
          }
        }
      ),
    );
  }
}
