import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

abstract class ProfileEvent extends Equatable {}

class GetProfileEvent extends ProfileEvent {
  final String uid;
  GetProfileEvent({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}



class SaveProfileInfoEvent extends ProfileEvent {
  final String email, name;
  final String? phone, location, website, designation, university, skill, company, photoURL;
  SaveProfileInfoEvent({required this.email, required this.name, this.phone, this.location, this.website, this.designation, this.university, this.skill, this.company, this.photoURL});

  @override
  // TODO: implement props
  List<Object?> get props => [email, name, phone, location, website, designation, university, skill, company];

}


// uploads image in firebase storage and adds its url in firebase database
class AddURLEvent extends ProfileEvent {
  final FilePickerResult result;
  AddURLEvent({required this.result});

  @override
  // TODO: implement props
  List<Object?> get props => [result];

}

class UploadImageURLEvent extends ProfileEvent {
  final String url;
  UploadImageURLEvent({required this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [url];

}

// class RemoveImageURLEvent extends ProfileError {
//
// }


