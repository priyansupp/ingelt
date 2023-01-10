import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/group_model.dart';
import '../../data/models/profile_model.dart';
import '../../data/models/user_grpdata_model.dart';

@immutable
abstract class UserGrpDataState extends Equatable {}

class InitUserGrpDataState extends UserGrpDataState {
  final UserGrpDataModel userGrpDataModel;
  InitUserGrpDataState({required this.userGrpDataModel});

  @override
  // TODO: implement props
  List<Object?> get props => [userGrpDataModel];

}

class UserGrpDataLoadingState extends UserGrpDataState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class UserGrpDataLoadedState extends UserGrpDataState {
  final UserGrpDataModel? userGrpDataModel;
  UserGrpDataLoadedState({required this.userGrpDataModel});
  @override
// TODO: implement props
  List<Object?> get props => [userGrpDataModel];

}


class UserGrpDataUpdatingState extends UserGrpDataState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class UserGrpDataUpdatedState extends UserGrpDataState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class UserGrpDataErrorState extends UserGrpDataState {
  final String error;
  UserGrpDataErrorState({required this.error});
  @override
// TODO: implement props
  List<Object?> get props => [error];

}


class RequestedToGroupsLoaded extends UserGrpDataState {
  final List<GroupModel>? requestedToGroups;
  RequestedToGroupsLoaded({required this.requestedToGroups});
  @override
  // TODO: implement props
  List<Object?> get props => [requestedToGroups];

}

class AllyGroupsLoaded extends UserGrpDataState {
  final List<GroupModel>? allyGroups;
  AllyGroupsLoaded({required this.allyGroups});
  @override
  // TODO: implement props
  List<Object?> get props => [allyGroups];

}


class RequestedToGroupsLoading extends UserGrpDataState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class AllyGroupsLoading extends UserGrpDataState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}


class RequestsFromLoaded extends UserGrpDataState {
  final List<ProfileModel>? requestedProfiles;
  RequestsFromLoaded({required this.requestedProfiles});
  @override
  // TODO: implement props
  List<Object?> get props => [requestedProfiles];

}


