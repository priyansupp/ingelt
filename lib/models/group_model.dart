import 'package:ingelt/models/user_model.dart';

class GroupModel {
  final String id;
  final String name;
  final UserModel admin;
  final String time;
  final String imageUrl;

  GroupModel({required this.name, required this.id, required this.admin, required this.time, required this.imageUrl});
}

// USERS
final UserModel priyanshu = UserModel(
  uid: '0',
  displayName: 'Priyanshu',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);
final UserModel greg = UserModel(
  uid: '1',
  displayName: 'Greg',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);
final UserModel james = UserModel(
  uid: '2',
  displayName: 'James',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);
final UserModel john = UserModel(
  uid: '3',
  displayName: 'John',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);
final UserModel olivia = UserModel(
  uid: '4',
  displayName: 'Olivia',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);
final UserModel sam = UserModel(
  uid: '5',
  displayName: 'Sam',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);
final UserModel sophia = UserModel(
  uid: '6',
  displayName: 'Sophia',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);
final UserModel steven = UserModel(
  uid: '7',
  displayName: 'Steven',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);


List<GroupModel> groups = [
  GroupModel(name: 'GST', id: '0', admin: priyanshu, time: '1:20 PM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Hello', id: '1', admin: steven, time: '2:20 PM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Taxation', id: '2', admin: sophia, time: '5:57 AM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Nameless', id: '3', admin: sam, time: '12:30 PM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Crypto', id: '4', admin: james, time: '9:20 AM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Game of Thrones', id: '5', admin: john, time: '7:18 PM', imageUrl: 'assets/group.png'),
];
