import 'package:bloc/bloc.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_event.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_state.dart';
import 'package:ingelt/data/models/user_grpdata_model.dart';

import '../../data/models/group_model.dart';
import '../../data/repositories/user_grpdata_repo.dart';

class UserGrpDataBloc extends Bloc<UserGrpDataEvent, UserGrpDataState> {
  final UserGrpDataRepository userGrpDataRepository;
  UserGrpDataBloc({required this.userGrpDataRepository}) : super(InitUserGrpDataState(userGrpDataModel: UserGrpDataModel())) {

    on<GetUserGrpDataEvent>((event, emit) async {
      emit(UserGrpDataLoadingState());
      try {
        final UserGrpDataModel? userGrpDataModel = await userGrpDataRepository.getUserGrpData(event.uid);
        emit(UserGrpDataLoadedState(userGrpDataModel: userGrpDataModel));
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    // on<CreateEmptyUserGrpDataEvent>((event, emit) async {
    //   emit(UserGrpDataUpdatingState());
    //   try {
    //     userGrpDataRepository.createEmptyUserGrpData();
    //     emit(UserGrpDataUpdatedState());
    //   } catch(e) {
    //     emit(UserGrpDataErrorState(error: e.toString()));
    //   }
    // });

    on<AddToPrvGrpListEvent>((event, emit) async {
      emit(UserGrpDataUpdatingState());
      try {
        userGrpDataRepository.addToPrvGrpList(event.grpId);
        emit(UserGrpDataUpdatedState());
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    on<AddToJoinedListEvent>((event, emit) async {
      emit(UserGrpDataUpdatingState());
      try {
        userGrpDataRepository.addToJoinedList(event.grpId);
        emit(UserGrpDataUpdatedState());
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    on<AddToRequestedToJoinListEvent>((event, emit) async {
      emit(UserGrpDataUpdatingState());
      try {
        userGrpDataRepository.addToRequestedToJoinList(event.grpId);
        emit(UserGrpDataUpdatedState());
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    on<AddToRequestsFromListEvent>((event, emit) async {
      emit(UserGrpDataUpdatingState());
      try {
        userGrpDataRepository.addToRequestsFromList(event.grpId);
        emit(UserGrpDataUpdatedState());
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    on<SetUserAsGroupAdminEvent>((event, emit) async {
      emit(UserGrpDataUpdatingState());
      try {
        userGrpDataRepository.setUserAsGroupAdmin(event.grpId);
        emit(UserGrpDataUpdatedState());
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    on<DeleteUserAdminGroupEvent>((event, emit) async {
      emit(UserGrpDataUpdatingState());
      try {
        userGrpDataRepository.deleteUserAdminGroup();
        emit(UserGrpDataUpdatedState());
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    on<GetPreviousGroupsListEvent>((event, emit) async {
      emit(UserGrpDataLoadingState());
      try {
        List<GroupModel>? previousGroups = await userGrpDataRepository.getPreviousGroupsList(event.uid);
        if(previousGroups == null || previousGroups == []) {
          emit(UserGrpDataErrorState(error: "No previous groups found"));
          return;
        }
        emit(PreviousGroupsLoadedState(previousGroups: previousGroups));
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

  }


}