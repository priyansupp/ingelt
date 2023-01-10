import 'package:equatable/equatable.dart';
import '../../data/models/group_model.dart';

abstract class IngeltGroupEvent extends Equatable {}

class GetIngeltGroupDetailsEvent extends IngeltGroupEvent {
  final String grpId;
  GetIngeltGroupDetailsEvent({required this.grpId});
  @override
  // TODO: implement props
  List<Object?> get props => [grpId];

}

class GetIngeltGroupsEvent extends IngeltGroupEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


