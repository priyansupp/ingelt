import 'package:ingelt/data/models/group_model.dart';
import 'package:ingelt/data/models/profile_model.dart';

class MessageModel {
  final ProfileModel sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;

  MessageModel({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
  });
}

// YOU - current user
final ProfileModel currentUser = ProfileModel(
  uid: '0',
  name: 'Current User',
  photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);

// USERS
final ProfileModel priyanshu = ProfileModel(
    uid: '0',
    name: 'Priyanshu',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
final ProfileModel greg = ProfileModel(
    uid: '1',
    name: 'Greg',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
final ProfileModel james = ProfileModel(
    uid: '2',
    name: 'James',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
final ProfileModel john = ProfileModel(
    uid: '3',
    name: 'John',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
final ProfileModel olivia = ProfileModel(
    uid: '4',
    name: 'Olivia',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
final ProfileModel sam = ProfileModel(
    uid: '5',
    name: 'Sam',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
final ProfileModel sophia = ProfileModel(
    uid: '6',
    name: 'Sophia',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
final ProfileModel steven = ProfileModel(
    uid: '7',
    name: 'Steven',
    photoURL: 'assets/person.jpg', phone: '9643763504', email: 'priyanshu@iitg.ac.in'
);
// FAVORITE CONTACTS
// List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE MESSAGES IN GROUP CHAT SCREEN
List<MessageModel> messages = [
  MessageModel(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?james',
    isLiked: false,
  ),
  MessageModel(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?olivia',
    isLiked: false,
  ),
  MessageModel(
    sender: priyanshu,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?priyanshu',
    isLiked: false,
  ),
  MessageModel(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?sophia',
    isLiked: false,
  ),
  MessageModel(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?steven',
    isLiked: false,
  ),
  MessageModel(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?sam',
    isLiked: false,
  ),
  MessageModel(
    sender: priyanshu,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?priyanshu',
    isLiked: false,
  ),
];