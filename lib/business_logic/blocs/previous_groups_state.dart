import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/group_model.dart';
import '../../data/models/user_grpdata_model.dart';

@immutable
abstract class PreviousGroupsState extends Equatable {}

class InitPreviousGrpDataState extends PreviousGroupsState {
  final UserGrpDataModel userGrpDataModel;
  InitPreviousGrpDataState({required this.userGrpDataModel});

  @override
  // TODO: implement props
  List<Object?> get props => [userGrpDataModel];

}

class PreviousGrpDataLoadingState extends PreviousGroupsState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class PreviousGrpDataErrorState extends PreviousGroupsState {
  final String error;
  PreviousGrpDataErrorState({required this.error});
  @override
// TODO: implement props
  List<Object?> get props => [error];

}

class PreviousGroupsLoadedState extends PreviousGroupsState {
  final List<GroupModel> previousGroups;
  PreviousGroupsLoadedState({required this.previousGroups});

  @override
  // TODO: implement props
  List<Object?> get props => [previousGroups];
}
