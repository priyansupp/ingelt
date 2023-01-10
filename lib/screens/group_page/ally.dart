import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/group_bloc.dart';
import '../../business_logic/blocs/group_event.dart';
import '../../business_logic/blocs/group_state.dart';
import '../../business_logic/blocs/user_grpdata_bloc.dart';
import '../../business_logic/blocs/user_grpdata_event.dart';
import '../../business_logic/blocs/user_grpdata_state.dart';
import '../../data/models/group_model.dart';
import '../../data/models/user_grpdata_model.dart';
import 'ally_req_group.dart';

class Ally extends StatefulWidget {
  const Ally({Key? key}) : super(key: key);

  @override
  State<Ally> createState() => _AllyState();
}

class _AllyState extends State<Ally> {

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // TODO: implement initState
    context.read<UserGrpDataBloc>().add(GetAllyGroupsEvent(uid: currentUser.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.userGrpDataModel);
    return Container(
        padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
        color: Colors.white,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.8,
        child: Expanded(
            child: BlocBuilder<UserGrpDataBloc, UserGrpDataState>(
              builder: (context, state) {
                if(state is AllyGroupsLoaded) {
                  List<GroupModel>? allyGroups = state.allyGroups;
                  if(allyGroups!.isEmpty) return const SizedBox.shrink();
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return AllyReqGroup(groupModel: allyGroups[index], isAlly: true);
                    },
                    itemCount: allyGroups.length,

                  );
                } else if(state is UserGrpDataErrorState) {
                  return Center(child: Text(state.error),);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )

        ),
    );
  }
}

