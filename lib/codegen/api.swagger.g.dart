// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreationRequest _$UserCreationRequestFromJson(Map<String, dynamic> json) =>
    UserCreationRequest(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserCreationRequestToJson(
        UserCreationRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'password': instance.password,
      'gender': instance.gender,
      'birthDate': instance.birthDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    AuthTokenResponse(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthTokenResponseToJson(AuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      password: json['password'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'username': instance.username,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      username: json['username'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
    };

GoogleRequest _$GoogleRequestFromJson(Map<String, dynamic> json) =>
    GoogleRequest(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      accessToken: json['accessToken'] as String?,
      profilePicture: json['profilePicture'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$GoogleRequestToJson(GoogleRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'accessToken': instance.accessToken,
      'profilePicture': instance.profilePicture,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequest(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordRequestToJson(
        ForgotPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
    };

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    UserUpdateRequest(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      profilePicture: json['profilePicture'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilePicture': instance.profilePicture,
      'city': instance.city?.toJson(),
      'phoneNumber': instance.phoneNumber,
    };

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordRequest(
      oldPassword: json['oldPassword'] as String?,
      newPassword: json['newPassword'] as String?,
    );

Map<String, dynamic> _$UpdatePasswordRequestToJson(
        UpdatePasswordRequest instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };

UpdateEmailRequest _$UpdateEmailRequestFromJson(Map<String, dynamic> json) =>
    UpdateEmailRequest(
      newEmail: json['newEmail'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UpdateEmailRequestToJson(UpdateEmailRequest instance) =>
    <String, dynamic>{
      'newEmail': instance.newEmail,
      'password': instance.password,
    };

ConfirmationCodeModel _$ConfirmationCodeModelFromJson(
        Map<String, dynamic> json) =>
    ConfirmationCodeModel(
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ConfirmationCodeModelToJson(
        ConfirmationCodeModel instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

ValidateCodePasswordRequest _$ValidateCodePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateCodePasswordRequest(
      value: json['value'] as String?,
      newPassword: json['newPassword'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ValidateCodePasswordRequestToJson(
        ValidateCodePasswordRequest instance) =>
    <String, dynamic>{
      'value': instance.value,
      'newPassword': instance.newPassword,
      'email': instance.email,
    };

UserIdResponse _$UserIdResponseFromJson(Map<String, dynamic> json) =>
    UserIdResponse(
      userId: json['userId'] as num?,
    );

Map<String, dynamic> _$UserIdResponseToJson(UserIdResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as num?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: userModelGenderFromJson(json['gender']),
      profilePicture: json['profilePicture'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      confirmed: json['confirmed'] as bool?,
      roles: userModelRolesListFromJson(json['roles'] as List?),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'password': instance.password,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': userModelGenderToJson(instance.gender),
      'profilePicture': instance.profilePicture,
      'city': instance.city?.toJson(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'confirmed': instance.confirmed,
      'roles': userModelRolesListToJson(instance.roles),
    };

DeleteUserRequest _$DeleteUserRequestFromJson(Map<String, dynamic> json) =>
    DeleteUserRequest(
      password: json['password'] as String?,
    );

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

DeleteUserByAdminRequest _$DeleteUserByAdminRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteUserByAdminRequest(
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$DeleteUserByAdminRequestToJson(
        DeleteUserByAdminRequest instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };
