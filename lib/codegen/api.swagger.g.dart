// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    AuthTokenResponse(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthTokenResponseToJson(AuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

CityEntity _$CityEntityFromJson(Map<String, dynamic> json) => CityEntity(
      id: json['id'] as num?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityEntityToJson(CityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
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

GenderEntity _$GenderEntityFromJson(Map<String, dynamic> json) => GenderEntity(
      id: json['id'] as num?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$GenderEntityToJson(GenderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

IterableUserEntity _$IterableUserEntityFromJson(Map<String, dynamic> json) =>
    IterableUserEntity();

Map<String, dynamic> _$IterableUserEntityToJson(IterableUserEntity instance) =>
    <String, dynamic>{};

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
      token: json['token'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
    };

RoleEntity _$RoleEntityFromJson(Map<String, dynamic> json) => RoleEntity(
      authority: json['authority'] as String?,
      id: json['id'] as num?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RoleEntityToJson(RoleEntity instance) =>
    <String, dynamic>{
      'authority': instance.authority,
      'id': instance.id,
      'name': instance.name,
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

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordRequest(
      newPassword: json['newPassword'] as String?,
      oldPassword: json['oldPassword'] as String?,
    );

Map<String, dynamic> _$UpdatePasswordRequestToJson(
        UpdatePasswordRequest instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'oldPassword': instance.oldPassword,
    };

UserCreationRequest _$UserCreationRequestFromJson(Map<String, dynamic> json) =>
    UserCreationRequest(
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      gender: json['gender'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UserCreationRequestToJson(
        UserCreationRequest instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate?.toIso8601String(),
      'email': instance.email,
      'firstname': instance.firstname,
      'gender': instance.gender,
      'lastname': instance.lastname,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
    };

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      city: json['city'] == null
          ? null
          : CityEntity.fromJson(json['city'] as Map<String, dynamic>),
      confirmed: json['confirmed'] as bool?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      gender: json['gender'] == null
          ? null
          : GenderEntity.fromJson(json['gender'] as Map<String, dynamic>),
      id: json['id'] as num?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePicture: json['profilePicture'] as String?,
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => RoleEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate?.toIso8601String(),
      'city': instance.city?.toJson(),
      'confirmed': instance.confirmed,
      'createdDate': instance.createdDate?.toIso8601String(),
      'email': instance.email,
      'firstname': instance.firstname,
      'gender': instance.gender?.toJson(),
      'id': instance.id,
      'lastname': instance.lastname,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
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
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      confirmed: json['confirmed'] as bool?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      gender: userModelGenderFromJson(json['gender']),
      id: json['id'] as num?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePicture: json['profilePicture'] as String?,
      roles: userModelRolesListFromJson(json['roles'] as List?),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'birthDate': instance.birthDate?.toIso8601String(),
      'city': instance.city?.toJson(),
      'confirmed': instance.confirmed,
      'createdDate': instance.createdDate?.toIso8601String(),
      'email': instance.email,
      'firstname': instance.firstname,
      'gender': userModelGenderToJson(instance.gender),
      'id': instance.id,
      'lastname': instance.lastname,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
      'roles': userModelRolesListToJson(instance.roles),
    };

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    UserUpdateRequest(
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'city': instance.city?.toJson(),
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
    };

ValidateCodePasswordRequest _$ValidateCodePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateCodePasswordRequest(
      email: json['email'] as String?,
      newPassword: json['newPassword'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ValidateCodePasswordRequestToJson(
        ValidateCodePasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
      'value': instance.value,
    };
