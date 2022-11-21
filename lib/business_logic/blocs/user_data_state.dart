import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/user_data_model.dart';

@immutable
abstract class UserDataState extends Equatable{}

class InitUserDataState extends UserDataState {
  final String uid;
  InitUserDataState({required this.uid});
  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}

class UserDataLoadingState extends UserDataState {
@override
// TODO: implement props
List<Object?> get props => [];

}

class UserDataLoadedState extends UserDataState {
  final UserDataModel? userDataModel;
  UserDataLoadedState({required this.userDataModel});
@override
// TODO: implement props
List<Object?> get props => [userDataModel];

}


class UserDataUpdatingState extends UserDataState {
@override
// TODO: implement props
List<Object?> get props => [];

}

class UserDataUpdatedState extends UserDataState {
  final UserDataModel? userDataModel;
  UserDataUpdatedState({required this.userDataModel});
  @override
  // TODO: implement props
  List<Object?> get props => [userDataModel];

}

class UserDataErrorState extends UserDataState {
  final String error;
  UserDataErrorState({required this.error});
@override
// TODO: implement props
List<Object?> get props => [error];

}
