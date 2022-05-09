class SignupCredentials {
  String _gender = "MAN";
  String _firstname = "";
  String _lastname = "";
  String _birthDate = "";
  String _email = "";
  String _password = "";
  String? _phoneNumber;
  String _language = "";
  String _city = "";

  SignupCredentials(
      {required String gender,
      required String firstname,
      required String lastname,
      required String birthDate,
      required String email,
      required String password,
      required String language,
      required String city,
      String? phoneNumber}) {
    this.gender = gender;
    this.firstname = firstname;
    this.lastname = lastname;
    this.birthDate = birthDate;
    this.email = email;
    this.password = password;
    this.phoneNumber = phoneNumber;
    this.language = language;
    this.city = city;
  }

  String get gender => _gender;

  set gender(String gender) => _gender = gender;

  String get firstname => _firstname;

  set firstname(String firstname) => _firstname = firstname;

  String get lastname => _lastname;

  set lastname(String lastname) => _lastname = lastname;

  String get birthDate => _birthDate;

  set birthDate(String birthDate) => _birthDate = birthDate;

  String get email => _email;

  set email(String email) => _email = email;

  String get password => _password;

  set password(String password) => _password = password;

  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;

  String get language => _language;

  set language(String language) => _language = language;

  String get city => _city;

  set city(String city) => _city = city;

  SignupCredentials.fromJson(Map<String, dynamic> json) {
    _gender = json['gender'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _birthDate = json['birthDate'];
    _email = json['email'];
    _password = json['password'];
    _phoneNumber = json['phoneNumber'];
    //_country = json['country'];
    _city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this._gender;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['birthDate'] = this._birthDate;
    data['email'] = this._email;
    data['password'] = this._password;
    data['phoneNumber'] = this._phoneNumber;
    //data['country'] = this._country;
    data['city'] = this._city;
    return data;
  }
}
