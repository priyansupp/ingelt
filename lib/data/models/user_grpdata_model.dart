class UserGrpDataModel {
  final String? adminGrpId;     // groupId whose admin is the currentUser
  final List<dynamic>? requestedToJoin;
  final List<dynamic>? joined;
  final List<dynamic>? previousGroups;
  final List<dynamic>? requestsFrom;

  UserGrpDataModel({
    this.adminGrpId,
    this.joined,
    this.previousGroups,
    this.requestedToJoin,
    this.requestsFrom,

  });


  // getting data from database
  static UserGrpDataModel fromJson(Map<String, dynamic> map) => UserGrpDataModel(
    adminGrpId: map['AdminGrpId'],
    joined: map['Joined'] as List<dynamic>,
    previousGroups: map['PreviousGroups'] as List<dynamic>,
    requestedToJoin: map['RequestedToJoin'] as List<dynamic>,
    requestsFrom: map['RequestsFrom'] as List<dynamic>,

  );

  Map<String, dynamic> toJson() => {
    'AdminGrpId': adminGrpId,
    'Joined': joined,
    'PreviousGroups': previousGroups,
    'RequestedToJoin': requestedToJoin,
    'RequestsFrom': requestsFrom,
  };
}