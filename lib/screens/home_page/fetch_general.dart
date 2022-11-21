import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/group_event.dart';
import 'package:ingelt/screens/home_page/vertical_groups.dart';

import '../../business_logic/blocs/group_bloc.dart';
import '../../business_logic/blocs/group_state.dart';
import '../../data/models/group_model.dart';

class FetchGeneral extends StatefulWidget {
  const FetchGeneral({Key? key}) : super(key: key);

  @override
  State<FetchGeneral> createState() => _FetchGeneralState();
}

class _FetchGeneralState extends State<FetchGeneral> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<GroupBloc>().add(GetGeneralGroupsEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if(state is GeneralGroupsLoaded) {
            List<GroupModel>? generalGroups = state.generalGroups;
            if(generalGroups!.isEmpty) return const SizedBox.shrink();
            return ListView.builder(
              itemBuilder: (context, index) {
                return VerGroup(
                  // date: '22nd July 2022', desc: "Ather's smart electric scooters with best-in-class settings to deal with.", category: 'Automobile', admin: 'Priyanshu Jaiswal', adminDesc: 'An aspiring app developer, and a web developer in making',
                  grpModel: generalGroups[index],
                  onHomePage: true,);
              },
              itemCount: generalGroups.length,

            );
          } else if(state is GroupErrorState) {
            return Center(child: Text(state.error),);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
