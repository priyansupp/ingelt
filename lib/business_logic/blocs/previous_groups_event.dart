import 'package:equatable/equatable.dart';

abstract class PreviousGroupsEvent extends Equatable {}

class GetPreviousGroupsListEvent extends PreviousGroupsEvent {
  final String uid;
  GetPreviousGroupsListEvent({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}