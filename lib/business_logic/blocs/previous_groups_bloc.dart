import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ingelt/business_logic/blocs/previous_groups_event.dart';
import 'package:ingelt/business_logic/blocs/previous_groups_state.dart';

import '../../data/models/group_model.dart';
import '../../data/models/user_grpdata_model.dart';
import '../../data/repositories/previous_groups_repo.dart';

class PreviousGroupsBloc extends Bloc<PreviousGroupsEvent, PreviousGroupsState> {
  final PreviousGroupsRepository previousGroupsRepository;
  PreviousGroupsBloc({required this.previousGroupsRepository}) : super(InitPreviousGrpDataState(userGrpDataModel: UserGrpDataModel())) {
    on<GetPreviousGroupsListEvent>((event, emit) async {
      emit(PreviousGrpDataLoadingState());
      try {
        List<GroupModel>? previousGroups = await previousGroupsRepository.getPreviousGroupsList(event.uid);
        if(previousGroups == null || previousGroups == []) {
          emit(PreviousGrpDataErrorState(error: "No previous groups found"));
          return;
        }
        emit(PreviousGroupsLoadedState(previousGroups: previousGroups));
      } catch(e) {
        emit(PreviousGrpDataErrorState(error: e.toString()));
      }
    });
  }
}