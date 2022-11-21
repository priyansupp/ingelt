class GroupModel {
  final String grpName;
  late String? grpId;
  final String grpAdmin;    // userID
  final String time;
  final String date;
  final String description;
  final int level;
  final String topic;
  final String category;
  final List<dynamic> participants;   // userIDs of participants


  GroupModel({
    required this.time,
    required this.grpId,
    required this.grpName,
    required this.grpAdmin,
    required this.date,
    required this.description,
    required this.level,
    required this.participants,
    required this.topic,
    required this.category,
  });

  // getting data from database

  // GroupModel.fromJson(Map<String, dynamic> map) {
  //   grpName = map['GrpName'];
  //   grpAdmin = map['GrpAdmin'];
  //   time = map['Time'];
  //   date = map['Date'];
  //   participants = map['Participants'];
  //   topic = map['Topic'];
  //   description = map['Description'];
  //   level = map['Level'];
  //   category = map['Category'];
  // }

  static GroupModel fromJson(Map<String, dynamic> map) => GroupModel(
      grpName: map['GrpName'],
      grpId: map['GrpId'],
      grpAdmin: map['GrpAdmin'],
      time: map['Time'],
      date: map['Date'],
      participants: map['Participants'] as List<dynamic>,
      topic: map['Topic'],
      description: map['Description'],
      level: map['Level'],
      category: map['Category'],
    );

    Map<String, dynamic> toJson() => {
      'GrpName': grpName,
      'GrpId': grpId,
      'GrpAdmin': grpAdmin,
      'Time': time,
      'Date': date,
      'Participants': participants,
      'Topic': topic,
      'Description': description,
      'Level': level,
      'Category': category
    };
  }

