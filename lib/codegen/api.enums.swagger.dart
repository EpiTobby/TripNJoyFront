import 'package:json_annotation/json_annotation.dart';

enum UserModelGender {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('FEMALE')
  female,
  @JsonValue('MALE')
  male,
  @JsonValue('NOT_SPECIFIED')
  notSpecified
}

const $UserModelGenderMap = {
  UserModelGender.female: 'FEMALE',
  UserModelGender.male: 'MALE',
  UserModelGender.notSpecified: 'NOT_SPECIFIED'
};

enum UserModelRoles {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('ADMIN')
  admin,
  @JsonValue('DEFAULT')
  $default
}

const $UserModelRolesMap = {
  UserModelRoles.admin: 'ADMIN',
  UserModelRoles.$default: 'DEFAULT'
};
