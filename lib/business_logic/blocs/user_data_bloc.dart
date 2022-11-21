import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ingelt/business_logic/blocs/user_data_event.dart';
import 'package:ingelt/business_logic/blocs/user_data_state.dart';
import '../../data/models/user_data_model.dart';
import '../../data/repositories/user_data_repo.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserDataRepository userDataRepository;
  final currentUser = FirebaseAuth.instance.currentUser;
  UserDataBloc({required this.userDataRepository}) : super(InitUserDataState(uid: '')){
    on<GetUserDataEvent> ((event, emit) async {
      emit(UserDataLoadingState());
      try {
        final UserDataModel? userDataModel = await userDataRepository.getUserData(event.uid);
        emit(UserDataLoadedState(userDataModel: userDataModel));
      } catch(e) {
        emit(UserDataErrorState(error: e.toString()));
      }
    });

    on<SetForteEvent> ((event, emit) async {
      emit(UserDataLoadingState());
      try {
        final UserDataModel? userDataModel = await userDataRepository.setForte(event.forte);
        emit(UserDataLoadedState(userDataModel: userDataModel));
      } catch(e) {
        emit(UserDataErrorState(error: e.toString()));
      }
    });


    on<SetFeaturedEvent> ((event, emit) async {
      emit(UserDataLoadingState());
      try {
        final UserDataModel? userDataModel = await userDataRepository.setFeatured(event.featured);
        emit(UserDataLoadedState(userDataModel: userDataModel));
      } catch(e) {
        emit(UserDataErrorState(error: e.toString()));
      }
    });


    on<SetConnectionsEvent> ((event, emit) async {
      emit(UserDataLoadingState());
      try {
        final UserDataModel? userDataModel = await userDataRepository.setConnections(event.connections);
        emit(UserDataLoadedState(userDataModel: userDataModel));
      } catch(e) {
        emit(UserDataErrorState(error: e.toString()));
      }
    });


    on<SetWorkingEvent> ((event, emit) async {
      emit(UserDataLoadingState());
      try {
        final UserDataModel? userDataModel = await userDataRepository.setWorking(event.working);
        emit(UserDataLoadedState(userDataModel: userDataModel));
      } catch(e) {
        emit(UserDataErrorState(error: e.toString()));
      }
    });

    on<SetRequestedFromEvent> ((event, emit) async {
      emit(UserDataLoadingState());
      try {
        final UserDataModel? userDataModel = await userDataRepository.setRequestedFrom(event.requestedFrom);
        emit(UserDataLoadedState(userDataModel: userDataModel));
      } catch(e) {
        emit(UserDataErrorState(error: e.toString()));
      }
    });

    on<SetRequestedToEvent> ((event, emit) async {
      emit(UserDataLoadingState());
      try {
        final UserDataModel? userDataModel = await userDataRepository.setRequestedTo(event.requestedTo);
        emit(UserDataLoadedState(userDataModel: userDataModel));
      } catch(e) {
        emit(UserDataErrorState(error: e.toString()));
      }
    });
  }

}