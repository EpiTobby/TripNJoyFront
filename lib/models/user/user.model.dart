class User {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  DateTime? birthDate;
  String? phoneNumber;
  String? profilePicture;

  User({this.id, this.firstname, this.lastname, this.email, this.birthDate, this.phoneNumber, this.profilePicture});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    birthDate = DateTime.parse(json['birthDate']);
    phoneNumber = json['phoneNumber'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['birthDate'] = this.birthDate;
    data['phoneNumber'] = this.phoneNumber;
    data['profilePicture'] = this.profilePicture;
    return data;
  }
}
