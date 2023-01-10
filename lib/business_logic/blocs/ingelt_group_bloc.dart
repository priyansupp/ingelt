import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ingelt/business_logic/blocs/ingelt_group_state.dart';
import 'package:ingelt/data/models/ingelt_group_model.dart';
import 'package:ingelt/data/repositories/ingelt_group_repo.dart';
import 'ingelt_group_event.dart';


class IngeltGroupBloc extends Bloc<IngeltGroupEvent, IngeltGroupState> {
  final IngeltGroupRepository ingeltGroupRepository;
  IngeltGroupBloc({required this.ingeltGroupRepository}) : super(InitIngeltGroupState(ingeltGroupModel: IngeltGroupModel(grpId: '', time: '', grpName: '', date: '', description: '', participants: [], topic: '', category: ''))) {

    // on<GetIngeltGroupDetailsEvent>((event, emit) async {
    //   emit(IngeltGroupLoadingState());
    //   try {
    //     final IngeltGroupModel? ingeltGroupModel = await ingeltGroupRepository.getIngeltGroupDetails(event.grpId);
    //     emit(IngeltGroupLoadedState(ingeltGroupModel: ingeltGroupModel));
    //   } catch(e) {
    //     emit(IngeltGroupErrorState(error: e.toString()));
    //   }
    // });

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


    on<GetIngeltGroupsEvent>((event, emit) async {
      emit(IngeltGroupsLoading());
      try {
        List<IngeltGroupModel>? ingeltGroups = await ingeltGroupRepository.getIngeltGroups();
        emit(IngeltGroupsLoaded(ingeltGroups: ingeltGroups));
      } catch(e) {
        emit(IngeltGroupErrorState(error: e.toString()));
      }
    });

  }
}