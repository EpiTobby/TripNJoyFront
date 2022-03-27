import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'api.enums.swagger.dart' as enums;
export 'api.enums.swagger.dart';

part 'api.swagger.chopper.dart';
part 'api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create({ChopperClient? client, String? baseUrl}) {
    if (client != null) {
      return _$Api(client);
    }

    final newClient = ChopperClient(
        services: [_$Api()],
        converter: $JsonSerializableConverter(),
        baseUrl: baseUrl ?? 'http://localhost:8080/');
    return _$Api(newClient);
  }

  ///Used to receive a confirmation to update a password
  ///@param forgotPasswordRequest forgotPasswordRequest
  Future<chopper.Response> authForgotPasswordPost(
      {required ForgotPasswordRequest? forgotPasswordRequest}) {
    generatedMapping.putIfAbsent(
        ForgotPasswordRequest, () => ForgotPasswordRequest.fromJsonFactory);

    return _authForgotPasswordPost(
        forgotPasswordRequest: forgotPasswordRequest);
  }

  ///Used to receive a confirmation to update a password
  ///@param forgotPasswordRequest forgotPasswordRequest
  @Post(path: '/auth/forgot/password')
  Future<chopper.Response> _authForgotPasswordPost(
      {@Body() required ForgotPasswordRequest? forgotPasswordRequest});

  ///Log a user, to allow authenticated endpoints
  ///@param loginRequest loginRequest
  Future<chopper.Response<LoginResponse>> authLoginPost(
      {required LoginRequest? loginRequest}) {
    generatedMapping.putIfAbsent(
        LoginRequest, () => LoginRequest.fromJsonFactory);
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _authLoginPost(loginRequest: loginRequest);
  }

  ///Log a user, to allow authenticated endpoints
  ///@param loginRequest loginRequest
  @Post(path: '/auth/login')
  Future<chopper.Response<LoginResponse>> _authLoginPost(
      {@Body() required LoginRequest? loginRequest});

  ///Create a new account. Will send a confirmation mail to the given address
  ///@param model model
  Future<chopper.Response<AuthTokenResponse>> authRegisterPost(
      {required UserCreationRequest? model}) {
    generatedMapping.putIfAbsent(
        UserCreationRequest, () => UserCreationRequest.fromJsonFactory);
    generatedMapping.putIfAbsent(
        AuthTokenResponse, () => AuthTokenResponse.fromJsonFactory);

    return _authRegisterPost(model: model);
  }

  ///Create a new account. Will send a confirmation mail to the given address
  ///@param model model
  @Post(path: '/auth/register')
  Future<chopper.Response<AuthTokenResponse>> _authRegisterPost(
      {@Body() required UserCreationRequest? model});

  ///Used to update the password with a confirmation code
  ///@param validateCodePasswordRequest validateCodePasswordRequest
  Future<chopper.Response<UserIdResponse>> authValidationPasswordPost(
      {required ValidateCodePasswordRequest? validateCodePasswordRequest}) {
    generatedMapping.putIfAbsent(ValidateCodePasswordRequest,
        () => ValidateCodePasswordRequest.fromJsonFactory);
    generatedMapping.putIfAbsent(
        UserIdResponse, () => UserIdResponse.fromJsonFactory);

    return _authValidationPasswordPost(
        validateCodePasswordRequest: validateCodePasswordRequest);
  }

  ///Used to update the password with a confirmation code
  ///@param validateCodePasswordRequest validateCodePasswordRequest
  @Post(path: '/auth/validation/password')
  Future<chopper.Response<UserIdResponse>> _authValidationPasswordPost(
      {@Body()
          required ValidateCodePasswordRequest? validateCodePasswordRequest});

  ///Confirm a user's email
  ///@param confirmationCode confirmationCode
  ///@param id id
  Future<chopper.Response> authIdConfirmationPatch(
      {required ConfirmationCodeModel? confirmationCode, required int? id}) {
    generatedMapping.putIfAbsent(
        ConfirmationCodeModel, () => ConfirmationCodeModel.fromJsonFactory);

    return _authIdConfirmationPatch(confirmationCode: confirmationCode, id: id);
  }

  ///Confirm a user's email
  ///@param confirmationCode confirmationCode
  ///@param id id
  @Patch(path: '/auth/{id}/confirmation')
  Future<chopper.Response> _authIdConfirmationPatch(
      {@Body() required ConfirmationCodeModel? confirmationCode,
      @Path('id') required int? id});

  ///Used to ask update the user email. Returns a new jwt
  ///@param id id
  ///@param updateEmailRequest updateEmailRequest
  Future<chopper.Response<LoginResponse>> authIdEmailPatch(
      {required int? id, required UpdateEmailRequest? updateEmailRequest}) {
    generatedMapping.putIfAbsent(
        UpdateEmailRequest, () => UpdateEmailRequest.fromJsonFactory);
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _authIdEmailPatch(id: id, updateEmailRequest: updateEmailRequest);
  }

  ///Used to ask update the user email. Returns a new jwt
  ///@param id id
  ///@param updateEmailRequest updateEmailRequest
  @Patch(path: '/auth/{id}/email')
  Future<chopper.Response<LoginResponse>> _authIdEmailPatch(
      {@Path('id') required int? id,
      @Body() required UpdateEmailRequest? updateEmailRequest});

  ///Used to update the password
  ///@param id id
  ///@param updatePasswordRequest updatePasswordRequest
  Future<chopper.Response> authIdPasswordPatch(
      {required int? id,
      required UpdatePasswordRequest? updatePasswordRequest}) {
    generatedMapping.putIfAbsent(
        UpdatePasswordRequest, () => UpdatePasswordRequest.fromJsonFactory);

    return _authIdPasswordPatch(
        id: id, updatePasswordRequest: updatePasswordRequest);
  }

  ///Used to update the password
  ///@param id id
  ///@param updatePasswordRequest updatePasswordRequest
  @Patch(path: '/auth/{id}/password')
  Future<chopper.Response> _authIdPasswordPatch(
      {@Path('id') required int? id,
      @Body() required UpdatePasswordRequest? updatePasswordRequest});

  ///Will send a new confirmation code to the user
  ///@param id id
  Future<chopper.Response> authIdResendPost({required int? id}) {
    return _authIdResendPost(id: id);
  }

  ///Will send a new confirmation code to the user
  ///@param id id
  @Post(path: '/auth/{id}/resend', optionalBody: true)
  Future<chopper.Response> _authIdResendPost({@Path('id') required int? id});

  ///getCurrentUser
  Future<chopper.Response<UserModel>> usersMeGet() {
    generatedMapping.putIfAbsent(UserModel, () => UserModel.fromJsonFactory);

    return _usersMeGet();
  }

  ///getCurrentUser
  @Get(path: '/users/me')
  Future<chopper.Response<UserModel>> _usersMeGet();

  ///getUserById
  ///@param id id
  Future<chopper.Response<UserModel>> usersIdGet({required int? id}) {
    generatedMapping.putIfAbsent(UserModel, () => UserModel.fromJsonFactory);

    return _usersIdGet(id: id);
  }

  ///getUserById
  ///@param id id
  @Get(path: '/users/{id}')
  Future<chopper.Response<UserModel>> _usersIdGet(
      {@Path('id') required int? id});

  ///deleteUserAccount
  ///@param deleteUserRequest deleteUserRequest
  ///@param id id
  Future<chopper.Response> usersIdDelete(
      {required DeleteUserRequest? deleteUserRequest, required int? id}) {
    generatedMapping.putIfAbsent(
        DeleteUserRequest, () => DeleteUserRequest.fromJsonFactory);

    return _usersIdDelete(deleteUserRequest: deleteUserRequest, id: id);
  }

  ///deleteUserAccount
  ///@param deleteUserRequest deleteUserRequest
  ///@param id id
  @Delete(path: '/users/{id}')
  Future<chopper.Response> _usersIdDelete(
      {@Body() required DeleteUserRequest? deleteUserRequest,
      @Path('id') required int? id});

  ///deleteUserByAdmin
  ///@param deleteUserByAdminRequest deleteUserByAdminRequest
  ///@param id id
  Future<chopper.Response> usersIdAdminDelete(
      {required DeleteUserByAdminRequest? deleteUserByAdminRequest,
      required int? id}) {
    generatedMapping.putIfAbsent(DeleteUserByAdminRequest,
        () => DeleteUserByAdminRequest.fromJsonFactory);

    return _usersIdAdminDelete(
        deleteUserByAdminRequest: deleteUserByAdminRequest, id: id);
  }

  ///deleteUserByAdmin
  ///@param deleteUserByAdminRequest deleteUserByAdminRequest
  ///@param id id
  @Delete(path: '/users/{id}/admin')
  Future<chopper.Response> _usersIdAdminDelete(
      {@Body() required DeleteUserByAdminRequest? deleteUserByAdminRequest,
      @Path('id') required int? id});

  ///Used to update the user information
  ///@param id id
  ///@param userUpdateRequest userUpdateRequest
  Future<chopper.Response> usersIdUpdatePatch(
      {required int? id, required UserUpdateRequest? userUpdateRequest}) {
    generatedMapping.putIfAbsent(
        UserUpdateRequest, () => UserUpdateRequest.fromJsonFactory);

    return _usersIdUpdatePatch(id: id, userUpdateRequest: userUpdateRequest);
  }

  ///Used to update the user information
  ///@param id id
  ///@param userUpdateRequest userUpdateRequest
  @Patch(path: '/users/{id}/update')
  Future<chopper.Response> _usersIdUpdatePatch(
      {@Path('id') required int? id,
      @Body() required UserUpdateRequest? userUpdateRequest});
}

@JsonSerializable(explicitToJson: true)
class AuthTokenResponse {
  AuthTokenResponse({
    this.token,
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$AuthTokenResponseFromJson;
  static const toJsonFactory = _$AuthTokenResponseToJson;
  Map<String, dynamic> toJson() => _$AuthTokenResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthTokenResponse &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^ runtimeType.hashCode;
}

extension $AuthTokenResponseExtension on AuthTokenResponse {
  AuthTokenResponse copyWith({String? token}) {
    return AuthTokenResponse(token: token ?? this.token);
  }
}

@JsonSerializable(explicitToJson: true)
class CityEntity {
  CityEntity({
    this.id,
    this.name,
  });

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      _$CityEntityFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CityEntityFromJson;
  static const toJsonFactory = _$CityEntityToJson;
  Map<String, dynamic> toJson() => _$CityEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CityEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CityEntityExtension on CityEntity {
  CityEntity copyWith({num? id, String? name}) {
    return CityEntity(id: id ?? this.id, name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class CityModel {
  CityModel({
    this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CityModelFromJson;
  static const toJsonFactory = _$CityModelToJson;
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CityModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $CityModelExtension on CityModel {
  CityModel copyWith({String? name}) {
    return CityModel(name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class ConfirmationCodeModel {
  ConfirmationCodeModel({
    this.value,
  });

  factory ConfirmationCodeModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationCodeModelFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$ConfirmationCodeModelFromJson;
  static const toJsonFactory = _$ConfirmationCodeModelToJson;
  Map<String, dynamic> toJson() => _$ConfirmationCodeModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmationCodeModel &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^ runtimeType.hashCode;
}

extension $ConfirmationCodeModelExtension on ConfirmationCodeModel {
  ConfirmationCodeModel copyWith({String? value}) {
    return ConfirmationCodeModel(value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class DeleteUserByAdminRequest {
  DeleteUserByAdminRequest({
    this.reason,
  });

  factory DeleteUserByAdminRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserByAdminRequestFromJson(json);

  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$DeleteUserByAdminRequestFromJson;
  static const toJsonFactory = _$DeleteUserByAdminRequestToJson;
  Map<String, dynamic> toJson() => _$DeleteUserByAdminRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteUserByAdminRequest &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reason) ^ runtimeType.hashCode;
}

extension $DeleteUserByAdminRequestExtension on DeleteUserByAdminRequest {
  DeleteUserByAdminRequest copyWith({String? reason}) {
    return DeleteUserByAdminRequest(reason: reason ?? this.reason);
  }
}

@JsonSerializable(explicitToJson: true)
class DeleteUserRequest {
  DeleteUserRequest({
    this.password,
  });

  factory DeleteUserRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRequestFromJson(json);

  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$DeleteUserRequestFromJson;
  static const toJsonFactory = _$DeleteUserRequestToJson;
  Map<String, dynamic> toJson() => _$DeleteUserRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteUserRequest &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^ runtimeType.hashCode;
}

extension $DeleteUserRequestExtension on DeleteUserRequest {
  DeleteUserRequest copyWith({String? password}) {
    return DeleteUserRequest(password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class ForgotPasswordRequest {
  ForgotPasswordRequest({
    this.email,
  });

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$ForgotPasswordRequestFromJson;
  static const toJsonFactory = _$ForgotPasswordRequestToJson;
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForgotPasswordRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $ForgotPasswordRequestExtension on ForgotPasswordRequest {
  ForgotPasswordRequest copyWith({String? email}) {
    return ForgotPasswordRequest(email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class GenderEntity {
  GenderEntity({
    this.id,
    this.value,
  });

  factory GenderEntity.fromJson(Map<String, dynamic> json) =>
      _$GenderEntityFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$GenderEntityFromJson;
  static const toJsonFactory = _$GenderEntityToJson;
  Map<String, dynamic> toJson() => _$GenderEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GenderEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $GenderEntityExtension on GenderEntity {
  GenderEntity copyWith({num? id, String? value}) {
    return GenderEntity(id: id ?? this.id, value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class LoginRequest {
  LoginRequest({
    this.password,
    this.username,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'username')
  final String? username;
  static const fromJsonFactory = _$LoginRequestFromJson;
  static const toJsonFactory = _$LoginRequestToJson;
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginRequest &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $LoginRequestExtension on LoginRequest {
  LoginRequest copyWith({String? password, String? username}) {
    return LoginRequest(
        password: password ?? this.password,
        username: username ?? this.username);
  }
}

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  LoginResponse({
    this.token,
    this.username,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'username')
  final String? username;
  static const fromJsonFactory = _$LoginResponseFromJson;
  static const toJsonFactory = _$LoginResponseToJson;
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginResponse &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $LoginResponseExtension on LoginResponse {
  LoginResponse copyWith({String? token, String? username}) {
    return LoginResponse(
        token: token ?? this.token, username: username ?? this.username);
  }
}

@JsonSerializable(explicitToJson: true)
class RoleEntity {
  RoleEntity({
    this.authority,
    this.id,
    this.name,
  });

  factory RoleEntity.fromJson(Map<String, dynamic> json) =>
      _$RoleEntityFromJson(json);

  @JsonKey(name: 'authority')
  final String? authority;
  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$RoleEntityFromJson;
  static const toJsonFactory = _$RoleEntityToJson;
  Map<String, dynamic> toJson() => _$RoleEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RoleEntity &&
            (identical(other.authority, authority) ||
                const DeepCollectionEquality()
                    .equals(other.authority, authority)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(authority) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $RoleEntityExtension on RoleEntity {
  RoleEntity copyWith({String? authority, num? id, String? name}) {
    return RoleEntity(
        authority: authority ?? this.authority,
        id: id ?? this.id,
        name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateEmailRequest {
  UpdateEmailRequest({
    this.newEmail,
    this.password,
  });

  factory UpdateEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailRequestFromJson(json);

  @JsonKey(name: 'newEmail')
  final String? newEmail;
  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$UpdateEmailRequestFromJson;
  static const toJsonFactory = _$UpdateEmailRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateEmailRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateEmailRequest &&
            (identical(other.newEmail, newEmail) ||
                const DeepCollectionEquality()
                    .equals(other.newEmail, newEmail)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(newEmail) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $UpdateEmailRequestExtension on UpdateEmailRequest {
  UpdateEmailRequest copyWith({String? newEmail, String? password}) {
    return UpdateEmailRequest(
        newEmail: newEmail ?? this.newEmail,
        password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdatePasswordRequest {
  UpdatePasswordRequest({
    this.newPassword,
    this.oldPassword,
  });

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  @JsonKey(name: 'newPassword')
  final String? newPassword;
  @JsonKey(name: 'oldPassword')
  final String? oldPassword;
  static const fromJsonFactory = _$UpdatePasswordRequestFromJson;
  static const toJsonFactory = _$UpdatePasswordRequestToJson;
  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePasswordRequest &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.oldPassword, oldPassword) ||
                const DeepCollectionEquality()
                    .equals(other.oldPassword, oldPassword)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(oldPassword) ^
      runtimeType.hashCode;
}

extension $UpdatePasswordRequestExtension on UpdatePasswordRequest {
  UpdatePasswordRequest copyWith({String? newPassword, String? oldPassword}) {
    return UpdatePasswordRequest(
        newPassword: newPassword ?? this.newPassword,
        oldPassword: oldPassword ?? this.oldPassword);
  }
}

@JsonSerializable(explicitToJson: true)
class UserCreationRequest {
  UserCreationRequest({
    this.birthDate,
    this.email,
    this.firstname,
    this.gender,
    this.lastname,
    this.password,
    this.phoneNumber,
  });

  factory UserCreationRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreationRequestFromJson(json);

  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  static const fromJsonFactory = _$UserCreationRequestFromJson;
  static const toJsonFactory = _$UserCreationRequestToJson;
  Map<String, dynamic> toJson() => _$UserCreationRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserCreationRequest &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      runtimeType.hashCode;
}

extension $UserCreationRequestExtension on UserCreationRequest {
  UserCreationRequest copyWith(
      {DateTime? birthDate,
      String? email,
      String? firstname,
      String? gender,
      String? lastname,
      String? password,
      String? phoneNumber}) {
    return UserCreationRequest(
        birthDate: birthDate ?? this.birthDate,
        email: email ?? this.email,
        firstname: firstname ?? this.firstname,
        gender: gender ?? this.gender,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }
}

@JsonSerializable(explicitToJson: true)
class UserIdResponse {
  UserIdResponse({
    this.userId,
  });

  factory UserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$UserIdResponseFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  static const fromJsonFactory = _$UserIdResponseFromJson;
  static const toJsonFactory = _$UserIdResponseToJson;
  Map<String, dynamic> toJson() => _$UserIdResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserIdResponse &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^ runtimeType.hashCode;
}

extension $UserIdResponseExtension on UserIdResponse {
  UserIdResponse copyWith({num? userId}) {
    return UserIdResponse(userId: userId ?? this.userId);
  }
}

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel({
    this.birthDate,
    this.city,
    this.confirmed,
    this.createdDate,
    this.email,
    this.firstname,
    this.gender,
    this.id,
    this.lastname,
    this.password,
    this.phoneNumber,
    this.profilePicture,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(name: 'city')
  final CityModel? city;
  @JsonKey(name: 'confirmed')
  final bool? confirmed;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(
      name: 'gender',
      toJson: userModelGenderToJson,
      fromJson: userModelGenderFromJson)
  final enums.UserModelGender? gender;
  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(
      name: 'roles',
      toJson: userModelRolesListToJson,
      fromJson: userModelRolesListFromJson)
  final List<enums.UserModelRoles>? roles;
  static const fromJsonFactory = _$UserModelFromJson;
  static const toJsonFactory = _$UserModelToJson;
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserModel &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(roles) ^
      runtimeType.hashCode;
}

extension $UserModelExtension on UserModel {
  UserModel copyWith(
      {DateTime? birthDate,
      CityModel? city,
      bool? confirmed,
      DateTime? createdDate,
      String? email,
      String? firstname,
      enums.UserModelGender? gender,
      num? id,
      String? lastname,
      String? password,
      String? phoneNumber,
      String? profilePicture,
      List<enums.UserModelRoles>? roles}) {
    return UserModel(
        birthDate: birthDate ?? this.birthDate,
        city: city ?? this.city,
        confirmed: confirmed ?? this.confirmed,
        createdDate: createdDate ?? this.createdDate,
        email: email ?? this.email,
        firstname: firstname ?? this.firstname,
        gender: gender ?? this.gender,
        id: id ?? this.id,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profilePicture: profilePicture ?? this.profilePicture,
        roles: roles ?? this.roles);
  }
}

@JsonSerializable(explicitToJson: true)
class UserUpdateRequest {
  UserUpdateRequest({
    this.city,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.profilePicture,
  });

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);

  @JsonKey(name: 'city')
  final CityModel? city;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  static const fromJsonFactory = _$UserUpdateRequestFromJson;
  static const toJsonFactory = _$UserUpdateRequestToJson;
  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserUpdateRequest &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      runtimeType.hashCode;
}

extension $UserUpdateRequestExtension on UserUpdateRequest {
  UserUpdateRequest copyWith(
      {CityModel? city,
      String? firstname,
      String? lastname,
      String? phoneNumber,
      String? profilePicture}) {
    return UserUpdateRequest(
        city: city ?? this.city,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profilePicture: profilePicture ?? this.profilePicture);
  }
}

@JsonSerializable(explicitToJson: true)
class ValidateCodePasswordRequest {
  ValidateCodePasswordRequest({
    this.email,
    this.newPassword,
    this.value,
  });

  factory ValidateCodePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ValidateCodePasswordRequestFromJson(json);

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'newPassword')
  final String? newPassword;
  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$ValidateCodePasswordRequestFromJson;
  static const toJsonFactory = _$ValidateCodePasswordRequestToJson;
  Map<String, dynamic> toJson() => _$ValidateCodePasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateCodePasswordRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $ValidateCodePasswordRequestExtension on ValidateCodePasswordRequest {
  ValidateCodePasswordRequest copyWith(
      {String? email, String? newPassword, String? value}) {
    return ValidateCodePasswordRequest(
        email: email ?? this.email,
        newPassword: newPassword ?? this.newPassword,
        value: value ?? this.value);
  }
}

String? userModelGenderToJson(enums.UserModelGender? userModelGender) {
  return enums.$UserModelGenderMap[userModelGender];
}

enums.UserModelGender userModelGenderFromJson(Object? userModelGender) {
  if (userModelGender is int) {
    return enums.$UserModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelGender.toString(),
            orElse: () => const MapEntry(
                enums.UserModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (userModelGender is String) {
    return enums.$UserModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UserModelGender.swaggerGeneratedUnknown;
}

List<String> userModelGenderListToJson(
    List<enums.UserModelGender>? userModelGender) {
  if (userModelGender == null) {
    return [];
  }

  return userModelGender.map((e) => enums.$UserModelGenderMap[e]!).toList();
}

List<enums.UserModelGender> userModelGenderListFromJson(List? userModelGender) {
  if (userModelGender == null) {
    return [];
  }

  return userModelGender
      .map((e) => userModelGenderFromJson(e.toString()))
      .toList();
}

String? userModelRolesToJson(enums.UserModelRoles? userModelRoles) {
  return enums.$UserModelRolesMap[userModelRoles];
}

enums.UserModelRoles userModelRolesFromJson(Object? userModelRoles) {
  if (userModelRoles is int) {
    return enums.$UserModelRolesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelRoles.toString(),
            orElse: () => const MapEntry(
                enums.UserModelRoles.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (userModelRoles is String) {
    return enums.$UserModelRolesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelRoles.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserModelRoles.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UserModelRoles.swaggerGeneratedUnknown;
}

List<String> userModelRolesListToJson(
    List<enums.UserModelRoles>? userModelRoles) {
  if (userModelRoles == null) {
    return [];
  }

  return userModelRoles.map((e) => enums.$UserModelRolesMap[e]!).toList();
}

List<enums.UserModelRoles> userModelRolesListFromJson(List? userModelRoles) {
  if (userModelRoles == null) {
    return [];
  }

  return userModelRoles
      .map((e) => userModelRolesFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
