import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/user_data_event.dart';
import 'package:ingelt/data/models/group_model.dart';
import 'package:ingelt/screens/home_page/vertical_groups.dart';
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
    context.read<UserDataBloc>().add(GetSpecificGroupsEvent(uid: currentUser.uid));
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 5.0, right: 15.0, left: 15.0),
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
          if(state is SpecificGroupsLoadedState) {
            List<GroupModel>? specificGroups = state.specificGroups;
            if(specificGroups!.isEmpty) return const SizedBox.shrink();
            // print(specificGroups[0].grpName);
            // print(specificGroups.runtimeType);
            return ListView.builder(
              itemBuilder: (context, index) {
                // print('${specificGroups[index].topic}$index');
                return VerGroup(
                  grpModel: specificGroups[index],
                  onHomePage: true,
                );
              },
              itemCount: specificGroups.length,
            );

          } else if (state is SpecificGroupsLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is UserDataErrorState) {
            return Center(child: Text(state.error.toString()),);
          } else {
            return const Center(child: Text("Some error occurred"),);
          }
        }
      ),
    );
  }
}
