class ProfileModel {
  final String uid;
  final String name;
  final String email;
  final String? photoURL;   // can be nullable
  final String? phone;   // can be nullable
  final String? designation;   // can be nullable
  final String? skill;   // can be nullable
  final String? location;   // can be nullable
  final String? website;   // can be nullable
  final String? university;   // can be nullable
  final String? company;   // can be nullable


  ProfileModel(
    {
      required this.uid,
      required this.name,
      required this.email,
      this.designation,
      this.skill,
      this.location,
      this.website,
      this.university,
      this.photoURL,
      this.phone,
      this.company,
    }
  );

  // getting values from database
  static ProfileModel fromJson(Map<String, dynamic> map) => ProfileModel(
      uid: map['UID'],
      photoURL: map['PhotoURL'],
      email: map['Email'],
      name: map['Name'],
      phone: map['Phone'],
      designation: map['Designation'],
      skill: map['Skill'],
      website: map['Website'],
      location: map['Location'],
      university: map['University'],
      company: map['Company'],
  );

  Map<String, dynamic> toJson() => {
    'UID': uid,
    'PhotoURL': photoURL,
    'Email': email,
    'Name': name,
    'Phone': phone,
    'Designation': designation,
    'Skill': skill,
    'Website': website,
    'Location': location,
    'University': university,
    'Company': company
  };
}