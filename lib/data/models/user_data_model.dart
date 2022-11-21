class UserDataModel {
  final List<dynamic>? forte;
  final String? working;
  final List<dynamic>? connections;
  final List<dynamic>? requestedTo;
  final List<dynamic>? requestedFrom;
  final List<Map<dynamic, dynamic>>? featured; // first string is photoURL, second is description
  // add research experience here

  UserDataModel({
    this.connections,
    this.featured,
    this.forte,
    this.requestedFrom,
    this.requestedTo,
    this.working,
    // this.researchExperience
  });

  // getting data from database
  static UserDataModel fromJson(Map<String, dynamic> map) => UserDataModel(
    forte: map['Forte'],
    connections: map['Connections'],
    featured: map['Featured'],
    requestedFrom: map['RequestedFrom'],
    requestedTo: map['RequestedTo'],
    working: map['Working'],

  );
}