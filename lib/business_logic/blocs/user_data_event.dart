import 'package:equatable/equatable.dart';

abstract class UserDataEvent extends Equatable {}

class GetUserDataEvent extends UserDataEvent {
  final String uid;
  GetUserDataEvent({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}

class SetForteEvent extends UserDataEvent {
  final List<int>? forte;
  SetForteEvent({required this.forte});

  @override
  // TODO: implement props
  List<Object?> get props => [forte];
}


class SetWorkingEvent extends UserDataEvent {
  final String? working;
  SetWorkingEvent({required this.working});

  @override
  // TODO: implement props
  List<Object?> get props => [working];
}


class SetConnectionsEvent extends UserDataEvent {
  final List<String>? connections;
  SetConnectionsEvent({required this.connections});

  @override
  // TODO: implement props
  List<Object?> get props => [connections];
}


class SetRequestedToEvent extends UserDataEvent {
  final List<String>? requestedTo;
  SetRequestedToEvent({required this.requestedTo});

  @override
  // TODO: implement props
  List<Object?> get props => [requestedTo];
}


class SetRequestedFromEvent extends UserDataEvent {
  final List<String>? requestedFrom;
  SetRequestedFromEvent({required this.requestedFrom});

  @override
  // TODO: implement props
  List<Object?> get props => [requestedFrom];
}

class SetFeaturedEvent extends UserDataEvent {
  final List<Map<String, String>>? featured;
  SetFeaturedEvent({required this.featured});

  @override
  // TODO: implement props
  List<Object?> get props => [featured];
}


class GetConnectionsRequestedFromEvent extends UserDataEvent {
  final String uid;
  GetConnectionsRequestedFromEvent({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];
}


class GetSpecificGroupsEvent extends UserDataEvent {
  final String uid;
  GetSpecificGroupsEvent({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];
}



