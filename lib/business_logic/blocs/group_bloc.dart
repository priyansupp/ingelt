import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ingelt/business_logic/blocs/group_state.dart';
import 'package:ingelt/data/models/group_model.dart';
import 'package:ingelt/data/repositories/group_repo.dart';
import 'group_event.dart';


class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupRepository groupRepository;
  GroupBloc({required this.groupRepository}) : super(InitGroupState(groupModel: GroupModel(grpId: '', time: '', grpName: '', grpAdmin: '', date: '', description: '', level: 0, participants: [], topic: '', category: ''))) {

    on<GetGroupDetailsEvent>((event, emit) async {
      emit(GroupLoadingState());
      try {
        final GroupModel? groupModel = await groupRepository.getGroupDetails(event.grpId);
        emit(GroupLoadedState(groupModel: groupModel));
      } catch(e) {
        emit(GroupErrorState(error: e.toString()));
      }
    });

    // on<AddParticipantsEvent>((event, emit) async {
    //   emit(GroupLoadingState());
    //   try {
    //     final GroupModel? groupModel = await groupRepository.addParticipants();
    //     emit(GroupLoadedState(groupModel: groupModel));
    //   } catch(e) {
    //     emit(GroupErrorState(error: e.toString()));
    //   }
    // });

    // on<UpdateTimeEvent>((event, emit) async {
    //   emit(GroupLoadingState());
    //   try {
    //     final GroupModel? groupModel = await groupRepository.updateGroupTime();
    //     emit(GroupLoadedState(groupModel: groupModel));
    //   } catch(e) {
    //     emit(GroupErrorState(error: e.toString()));
    //   }
    // });
    //
    // on<DeleteGroupEvent>((event, emit) async {
    //   emit(GroupLoadingState());
    //   try {
    //     final GroupModel? groupModel = await groupRepository.deleteGroup(event.grpId);
    //     emit(GroupLoadedState(groupModel: groupModel));
    //   } catch(e) {
    //     emit(GroupErrorState(error: e.toString()));
    //   }
    // });

    on<CreateGroupEvent>((event, emit) async {
      emit(GroupCreatingState());
      try {
        final GroupModel? groupModel = await groupRepository.createGroup(event.groupModel);
        emit(GroupCreatedState(groupModel: groupModel));
      } catch(e) {
        emit(GroupErrorState(error: e.toString()));
      }
    });

    on<GetGeneralGroupsEvent>((event, emit) async {
      emit(GeneralGroupsLoading());
      try {
        List<GroupModel>? generalGroups = await groupRepository.getGeneralGroups();
        emit(GeneralGroupsLoaded(generalGroups: generalGroups));
      } catch(e) {
        emit(GroupErrorState(error: e.toString()));
      }
    });

  }
}