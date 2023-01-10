import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/group_model.dart';

@immutable
abstract class GroupState extends Equatable {}

class InitGroupState extends GroupState {
  final GroupModel groupModel;
  InitGroupState({required this.groupModel});

  @override
  // TODO: implement props
  List<Object?> get props => [groupModel];

}

class GroupLoadingState extends GroupState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class GroupLoadedState extends GroupState {
  final GroupModel? groupModel;
  GroupLoadedState({required this.groupModel});
  @override
// TODO: implement props
  List<Object?> get props => [groupModel];

}

class GroupCreatingState extends GroupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GroupCreatedState extends GroupState {
  final GroupModel? groupModel;
  GroupCreatedState({required this.groupModel});
  @override
  // TODO: implement props
  List<Object?> get props => [groupModel];

}

class GroupUpdatingState extends GroupState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class GroupUpdatedState extends GroupState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}

class GroupErrorState extends GroupState {
  final String error;
  GroupErrorState({required this.error});
  @override
// TODO: implement props
  List<Object?> get props => [error];

}

class GeneralGroupsLoading extends GroupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GeneralGroupsLoaded extends GroupState {
  final List<GroupModel>? generalGroups;
  GeneralGroupsLoaded({required this.generalGroups});
  @override
  // TODO: implement props
  List<Object?> get props => [generalGroups];

}



