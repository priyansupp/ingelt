import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/shared/constants.dart';
import '../../business_logic/blocs/group_bloc.dart';
import '../../business_logic/blocs/group_event.dart';
import '../../business_logic/blocs/group_state.dart';
import '../../business_logic/blocs/user_grpdata_bloc.dart';
import '../../business_logic/blocs/user_grpdata_event.dart';
import '../../business_logic/blocs/user_grpdata_state.dart';
import '../../data/models/group_model.dart';
import '../../data/models/user_grpdata_model.dart';
import 'ally_req_group.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // TODO: implement initState
    context.read<UserGrpDataBloc>().add(GetRequestedToGroupsEvent(uid: currentUser.uid));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, right: 15.0, left: 15.0),
      color: Colors.white,
      // width: MediaQuery.of(context).size.width*0.8,
      child: Expanded(
        child: BlocBuilder<UserGrpDataBloc, UserGrpDataState>(
          builder: (context, state) {
            if(state is RequestedToGroupsLoaded) {
              List<GroupModel>? requestedToGroups = state.requestedToGroups;
              if(requestedToGroups!.isEmpty) return const SizedBox.shrink();
              return ListView.builder(
                itemBuilder: (context, index) {
                  return AllyReqGroup(groupModel: requestedToGroups[index], isAlly: false);
                },
                itemCount: requestedToGroups.length,

              );
            } else if(state is UserGrpDataErrorState) {
              return Center(child: Text(state.error),);
            } else {
              return const CircularProgressIndicator();
            }
          },
        )

      )
    );
  }
}

class DayWidget extends StatefulWidget {
  final String day;
  const DayWidget({Key? key, required this.day}) : super(key: key);

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          Text(
            widget.day,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: AppThemeData.blackishTextColor
            ),
          ),
          const SizedBox(width: 5.0,),
          const Expanded(
            child: Divider(
              thickness: 1.0,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}

