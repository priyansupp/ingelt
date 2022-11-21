import 'package:equatable/equatable.dart';

abstract class UserGrpDataEvent extends Equatable {}

class GetUserGrpDataEvent extends UserGrpDataEvent {
  final String uid;
  GetUserGrpDataEvent({required this.uid});
  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}


class SetUserAsGroupAdminEvent extends UserGrpDataEvent {
  final String grpId;
  SetUserAsGroupAdminEvent({required this.grpId});

  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}

class DeleteUserAdminGroupEvent extends UserGrpDataEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AddToPrvGrpListEvent extends UserGrpDataEvent {
  final String grpId;
  AddToPrvGrpListEvent({required this.grpId});

  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}

class AddToJoinedListEvent extends UserGrpDataEvent {
  final String grpId;
  AddToJoinedListEvent({required this.grpId});

  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}


class AddToRequestedToJoinListEvent extends UserGrpDataEvent {
  final String grpId;
  AddToRequestedToJoinListEvent({required this.grpId});

  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}


class AddToRequestsFromListEvent extends UserGrpDataEvent {
  final String grpId;
  AddToRequestsFromListEvent({required this.grpId});

  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}

class GetPreviousGroupsListEvent extends UserGrpDataEvent {
  final String uid;
  GetPreviousGroupsListEvent({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}

class CreateEmptyUserGrpDataEvent extends UserGrpDataEvent {
  // final String uid;
  // CreateEmptyUserGrpDataEvent({required this.uid});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

