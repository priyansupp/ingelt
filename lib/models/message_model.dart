import 'package:ingelt/models/group_model.dart';
import 'package:ingelt/models/user_model.dart';

class MessageModel {
  final UserModel sender;
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
final UserModel currentUser = UserModel(
  uid: '0',
  displayName: 'Current User',
  photoURL: 'assets/person.jpg', phone: '9643763504', emailAddress: 'priyanshu@iitg.ac.in'
);

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