class SignInUpGoogleCredentials {
  String _firstname = "";
  String _lastname = "";
  String _email = "";
  String _password = "";
  String _profilePicture = "";
  String? _phoneNumber;

  SignInUpGoogleCredentials(
      {
        required String firstname,
        required String lastname,
        required String email,
        required String password,
        required String profilePicture,
        String? phoneNumber}) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.email = email;
    this.password = password;
    this.profilePicture = profilePicture;
    this.phoneNumber = phoneNumber;
  }

  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  String get email => _email;
  set email(String email) => _email = email;
  String get password => _password;
  set password(String password) => _password = password;
  String get profilePicture => _profilePicture;
  set profilePicture(String profilePicture) => _profilePicture = profilePicture;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;

  SignInUpGoogleCredentials.fromJson(Map<String, dynamic> json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _password = json['password'];
    _profilePicture = json['profilePicture'];
    _phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['email'] = this._email;
    data['password'] = this._password;
    data['profilePicture'] = this.profilePicture;
    data['phoneNumber'] = this._phoneNumber;
    return data;
  }
}
