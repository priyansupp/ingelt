import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/group_model.dart';
import '../../data/models/ingelt_group_model.dart';

@immutable
abstract class IngeltGroupState extends Equatable {}

class InitIngeltGroupState extends IngeltGroupState {
  final IngeltGroupModel ingeltGroupModel;
  InitIngeltGroupState({required this.ingeltGroupModel});

  @override
  // TODO: implement props
  List<Object?> get props => [ingeltGroupModel];

}

class IngeltGroupLoadingState extends IngeltGroupState {
  @override
// TODO: implement props
  List<Object?> get props => [];

}


class IngeltGroupErrorState extends IngeltGroupState {
  final String error;
  IngeltGroupErrorState({required this.error});
  @override
// TODO: implement props
  List<Object?> get props => [error];

}

class IngeltGroupsLoading extends IngeltGroupState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class IngeltGroupsLoaded extends IngeltGroupState {
  final List<IngeltGroupModel>? ingeltGroups;
  IngeltGroupsLoaded({required this.ingeltGroups});
  @override
  // TODO: implement props
  List<Object?> get props => [ingeltGroups];

}



