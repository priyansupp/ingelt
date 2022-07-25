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
  id: '0',
  name: 'Current User',
  imageUrl: 'assets/person.jpg',
);

// USERS
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

// FAVORITE CONTACTS
// List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE MESSAGES IN GROUP CHAT SCREEN
List<MessageModel> messages = [
  MessageModel(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
  ),
  MessageModel(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
  ),
  MessageModel(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
  ),
  MessageModel(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
  ),
  MessageModel(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
  ),
  MessageModel(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
  ),
  MessageModel(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
  ),
];