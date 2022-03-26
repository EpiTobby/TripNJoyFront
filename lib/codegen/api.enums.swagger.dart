import 'package:json_annotation/json_annotation.dart';

enum UserModelGender {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('MALE')
  male,
  @JsonValue('FEMALE')
  female,
  @JsonValue('NOT_SPECIFIED')
  notSpecified
}

const $UserModelGenderMap = {
  UserModelGender.male: 'MALE',
  UserModelGender.female: 'FEMALE',
  UserModelGender.notSpecified: 'NOT_SPECIFIED'
};

enum UserModelRoles {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('DEFAULT')
  $default,
  @JsonValue('ADMIN')
  admin
}

const $UserModelRolesMap = {
  UserModelRoles.$default: 'DEFAULT',
  UserModelRoles.admin: 'ADMIN'
};
