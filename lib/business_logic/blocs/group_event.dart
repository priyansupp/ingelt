import 'package:equatable/equatable.dart';
import '../../data/models/group_model.dart';

abstract class GroupEvent extends Equatable {}

class GetGroupDetailsEvent extends GroupEvent {
  final String grpId;
  GetGroupDetailsEvent({required this.grpId});
  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}

class AddParticipantsEvent extends GroupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class UpdateTimeEvent extends GroupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class DeleteGroupEvent extends GroupEvent {
  final String grpId;
  DeleteGroupEvent({required this.grpId});
  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}


class CreateGroupEvent extends GroupEvent {
  final GroupModel groupModel;
  CreateGroupEvent({required this.groupModel});
  @override
  // TODO: implement props
  List<Object?> get props => [groupModel];

}


class GetGeneralGroupsEvent extends GroupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


