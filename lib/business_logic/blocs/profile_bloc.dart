import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ingelt/business_logic/blocs/profile_event.dart';
import 'package:ingelt/business_logic/blocs/profile_state.dart';
import 'package:ingelt/data/models/profile_model.dart';

import '../../data/repositories/profile_repo.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({required this.profileRepository}) : super(InitProfileState(profileModel: ProfileModel(uid: '', name: '', email: ''))) {

    // this is the migration of mapEventToState method:

    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        final ProfileModel? profileModel = await profileRepository.getProfile(event.uid);
        emit(ProfileLoadedState(profileModel: profileModel));
      } catch(e) {
        emit(ProfileErrorState(error: e.toString()));
      }
    });

    on<SaveProfileInfoEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        final ProfileModel? profileModel = await profileRepository.saveProfileInfo(event.photoURL, event.email, event.name, event.phone, event.location, event.website, event.designation, event.university, event.skill, event.company);
        emit(ProfileLoadedState(profileModel: profileModel));
      } catch(e) {
        emit(ProfileErrorState(error: e.toString()));
      }
    });

    on<AddURLEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        final ProfileModel? profileModel = await profileRepository.addURL(event.result);
        emit(ProfileLoadedState(profileModel: profileModel));
      } catch(e) {
        emit(ProfileErrorState(error: e.toString()));
      }
    });

    on<UploadImageURLEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        final ProfileModel? profileModel = await profileRepository.uploadImageURL(event.url);
        emit(ProfileLoadedState(profileModel: profileModel));
      } catch(e) {
        emit(ProfileErrorState(error: e.toString()));
      }
    });
  }

}