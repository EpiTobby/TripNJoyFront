class SignInUpGoogleCredentials {
  String _firstname = "";
  String _lastname = "";
  String _email = "";
  String _accessToken = "";
  String _profilePicture = "";
  String? _phoneNumber;

  SignInUpGoogleCredentials(
      {
        required String firstname,
        required String lastname,
        required String email,
        required String accessToken,
        required String profilePicture,
        String? phoneNumber}) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.email = email;
    this.accessToken = accessToken;
    this.profilePicture = profilePicture;
    this.phoneNumber = phoneNumber;
  }

  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  String get email => _email;
  set email(String email) => _email = email;
  String get accessToken => _accessToken;
  set accessToken(String accessToken) => _accessToken = accessToken;
  String get profilePicture => _profilePicture;
  set profilePicture(String profilePicture) => _profilePicture = profilePicture;
  String? get phoneNumber => _phoneNumber;
  set phoneNumber(String? phoneNumber) => _phoneNumber = phoneNumber;

  SignInUpGoogleCredentials.fromJson(Map<String, dynamic> json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _accessToken = json['accessToken'];
    _profilePicture = json['profilePicture'];
    _phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['email'] = this._email;
    data['accessToken'] = this._accessToken;
    data['profilePicture'] = this.profilePicture;
    data['phoneNumber'] = this._phoneNumber;
    return data;
  }
}
