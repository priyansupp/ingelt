import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_event.dart';
import 'package:ingelt/business_logic/blocs/user_grpdata_state.dart';
import 'package:ingelt/data/models/user_grpdata_model.dart';

import '../../data/models/group_model.dart';
import '../../data/models/profile_model.dart';
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


    on<GetRequestedToGroupsEvent>((event, emit) async {
      emit(RequestedToGroupsLoading());
      try {
        List<GroupModel>? requestedToGroups = await userGrpDataRepository.getRequestedToGroups(event.uid);
        emit(RequestedToGroupsLoaded(requestedToGroups: requestedToGroups));
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    on<GetAllyGroupsEvent>((event, emit) async {
      emit(AllyGroupsLoading());
      try {
        List<GroupModel>? allyGroups = await userGrpDataRepository.getAllyGroups(event.uid);
        emit(AllyGroupsLoaded(allyGroups: allyGroups));
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });

    // requests from userIDs waiting to join the  group created by current user.
    on<GetRequestsFromEvent>((event, emit) async {
      emit(UserGrpDataLoadingState());
      try {
        List<ProfileModel>? requestedProfiles = await userGrpDataRepository.getRequestsFrom(event.uid);
        emit(RequestsFromLoaded(requestedProfiles: requestedProfiles));
      } catch(e) {
        emit(UserGrpDataErrorState(error: e.toString()));
      }
    });




  }


}