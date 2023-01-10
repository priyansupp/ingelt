import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/ingelt_group_event.dart';
import 'package:ingelt/data/models/ingelt_group_model.dart';
import '../../business_logic/blocs/ingelt_group_bloc.dart';
import '../../business_logic/blocs/ingelt_group_state.dart';
import 'horizontal_groups.dart';

class FetchHor extends StatefulWidget {
  const FetchHor({Key? key}) : super(key: key);

  @override
  State<FetchHor> createState() => _FetchHorState();
}

class _FetchHorState extends State<FetchHor> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IngeltGroupBloc>().add(GetIngeltGroupsEvent());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngeltGroupBloc, IngeltGroupState>(
      builder: (context, state) {
        if(state is IngeltGroupsLoaded) {
          List<IngeltGroupModel>? ingeltGroups = state.ingeltGroups;
          if(ingeltGroups!.isEmpty) return const SizedBox.shrink();
          return ListView.builder(
            itemBuilder: (context, index) {
              return HorGroup(ingeltGroupModel: ingeltGroups[index],);
            },
            itemCount: ingeltGroups.length,
            padding: const EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            itemExtent: 220.0,  // to fix the width of each item
          );
        } else if (state is IngeltGroupsLoading) {
          return const CircularProgressIndicator();
        } else if (state is IngeltGroupErrorState) {
          return Center(child: Text(state.error),);
        } else {
          return const Center(child: Text("Some error occurred"),);
        }
      },
    );
  }
}
