class UserModel {
  final String uid;
  final String displayName;
  final String? photoURL;   // can be nullable
  final String emailAddress;
  final String? phone;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.photoURL,
    required this.emailAddress,
    required this.phone,
  });

  static UserModel fromJson(Map<String, dynamic> map) => UserModel(
      uid: map['uid'],
      photoURL: map['photoURL'],
      emailAddress: map['emailAddress'],
      displayName: map['displayName'],
      phone: map['phone'],
  );
}