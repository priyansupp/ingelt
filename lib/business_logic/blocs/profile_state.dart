import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../data/models/profile_model.dart';

@immutable
abstract class ProfileState extends Equatable {}

// to be passed in super constructor when initializing bloc
class InitProfileState extends ProfileState {
  final ProfileModel profileModel;
  InitProfileState({required this.profileModel});

  @override
  // TODO: implement props
  List<Object?> get props => [profileModel];
}

// state when profile is loading
class ProfileLoadingState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

// when profile is loaded
class ProfileLoadedState extends ProfileState {
  final ProfileModel? profileModel;
  ProfileLoadedState({required this.profileModel});
  @override
  // TODO: implement props
  List<Object?> get props => [profileModel];

}

// state when profile is updating
class ProfileUpdatingState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


// state when profile is updated
class ProfileUpdatedState extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


// state of error
class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];

}

