class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.birthDate,
    this.phoneNumber,
    this.profilePicture,
  });

  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final DateTime birthDate;
  final String? phoneNumber;
  final String? profilePicture;
}
