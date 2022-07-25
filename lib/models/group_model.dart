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
  id: '0',
  name: 'Current User',
  imageUrl: 'assets/person.jpg',
);
final UserModel greg = UserModel(
  id: '1',
  name: 'Greg',
  imageUrl: 'assets/person.jpg',
);
final UserModel james = UserModel(
  id: '2',
  name: 'James',
  imageUrl: 'assets/person.jpg',
);
final UserModel john = UserModel(
  id: '3',
  name: 'John',
  imageUrl: 'assets/person.jpg',
);
final UserModel olivia = UserModel(
  id: '4',
  name: 'Olivia',
  imageUrl: 'assets/person.jpg',
);
final UserModel sam = UserModel(
  id: '5',
  name: 'Sam',
  imageUrl: 'assets/person.jpg',
);
final UserModel sophia = UserModel(
  id: '6',
  name: 'Sophia',
  imageUrl: 'assets/person.jpg',
);
final UserModel steven = UserModel(
  id: '7',
  name: 'Steven',
  imageUrl: 'assets/person.jpg',
);

List<GroupModel> groups = [
  GroupModel(name: 'GST', id: '0', admin: priyanshu, time: '1:20 PM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Hello', id: '1', admin: steven, time: '2:20 PM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Taxation', id: '2', admin: sophia, time: '5:57 AM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Nameless', id: '3', admin: sam, time: '12:30 PM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Crypto', id: '4', admin: james, time: '9:20 AM', imageUrl: 'assets/group.png'),
  GroupModel(name: 'Game of Thrones', id: '5', admin: john, time: '7:18 PM', imageUrl: 'assets/group.png'),
];
