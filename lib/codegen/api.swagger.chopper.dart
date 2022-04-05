// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$Api extends Api {
  _$Api([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Api;

  @override
  Future<Response<List<ProfileModel>>> _idProfilesGet({required num? id}) {
    final $url = '/${id}/profiles';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProfileModel>, ProfileModel>($request);
  }

  @override
  Future<Response<ProfileModel>> _idProfilesPost(
      {required num? id, required ProfileCreationRequest? body}) {
    final $url = '/${id}/profiles';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ProfileModel, ProfileModel>($request);
  }

  @override
  Future<Response<dynamic>> _authIdResendPost({required num? id}) {
    final $url = '/auth/${id}/resend';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AuthTokenResponse>> _authRegisterPost(
      {required UserCreationRequest? body}) {
    final $url = '/auth/register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthTokenResponse, AuthTokenResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> _authLoginPost(
      {required LoginRequest? body}) {
    final $url = '/auth/login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> _authGooglePost(
      {required GoogleRequest? body}) {
    final $url = '/auth/google';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<dynamic>> _authForgotPasswordPost(
      {required ForgotPasswordRequest? body}) {
    final $url = '/auth/forgot/password';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _idProfilesProfileUpdatePatch(
      {required num? id,
      required num? profile,
      required ProfileUpdateRequest? body}) {
    final $url = '/${id}/profiles/${profile}/update';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _idProfilesProfileReusePatch(
      {required num? id,
      required num? profile,
      required AvailabilityAnswerModel? body}) {
    final $url = '/${id}/profiles/${profile}/reuse';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdUpdatePatch(
      {required num? id, required UserUpdateRequest? body}) {
    final $url = '/users/${id}/update';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authIdPasswordPatch(
      {required num? id, required UpdatePasswordRequest? body}) {
    final $url = '/auth/${id}/password';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<LoginResponse>> _authIdEmailPatch(
      {required num? id, required UpdateEmailRequest? body}) {
    final $url = '/auth/${id}/email';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<dynamic>> _authIdConfirmationPatch(
      {required num? id, required ConfirmationCodeModel? body}) {
    final $url = '/auth/${id}/confirmation';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserIdResponse>> _authValidationPasswordPatch(
      {required ValidateCodePasswordRequest? body}) {
    final $url = '/auth/validation/password';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<UserIdResponse, UserIdResponse>($request);
  }

  @override
  Future<Response<List<ProfileModel>>> _idProfilesActiveGet() {
    final $url = '/{id}/profiles/active';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProfileModel>, ProfileModel>($request);
  }

  @override
  Future<Response<List<UserEntity>>> _usersGet() {
    final $url = '/users';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<UserEntity>, UserEntity>($request);
  }

  @override
  Future<Response<UserModel>> _usersIdGet({required num? id}) {
    final $url = '/users/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdDelete(
      {required num? id, required DeleteUserRequest? body}) {
    final $url = '/users/${id}';
    final $body = body;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserModel>> _usersMeGet() {
    final $url = '/users/me';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<dynamic>> _idProfilesProfileDelete(
      {required num? id, required num? profile}) {
    final $url = '/${id}/profiles/${profile}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdAdminDelete(
      {required num? id, required DeleteUserByAdminRequest? body}) {
    final $url = '/users/${id}/admin';
    final $body = body;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
