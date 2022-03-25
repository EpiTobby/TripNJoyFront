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
  Future<Response<dynamic>> _authForgotPasswordPost(
      {required ForgotPasswordRequest? forgotPasswordRequest}) {
    final $url = '/auth/forgot/password';
    final $body = forgotPasswordRequest;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<LoginResponse>> _authLoginPost(
      {required LoginRequest? loginRequest}) {
    final $url = '/auth/login';
    final $body = loginRequest;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<AuthTokenResponse>> _authRegisterPost(
      {required UserCreationRequest? model}) {
    final $url = '/auth/register';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthTokenResponse, AuthTokenResponse>($request);
  }

  @override
  Future<Response<UserIdResponse>> _authValidationPasswordPost(
      {required ValidateCodePasswordRequest? validateCodePasswordRequest}) {
    final $url = '/auth/validation/password';
    final $body = validateCodePasswordRequest;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserIdResponse, UserIdResponse>($request);
  }

  @override
  Future<Response<dynamic>> _authIdConfirmationPatch(
      {required ConfirmationCodeModel? confirmationCode, required int? id}) {
    final $url = '/auth/${id}/confirmation';
    final $body = confirmationCode;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<LoginResponse>> _authIdEmailPatch(
      {required int? id, required UpdateEmailRequest? updateEmailRequest}) {
    final $url = '/auth/${id}/email';
    final $body = updateEmailRequest;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<dynamic>> _authIdPasswordPatch(
      {required int? id,
      required UpdatePasswordRequest? updatePasswordRequest}) {
    final $url = '/auth/${id}/password';
    final $body = updatePasswordRequest;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authIdResendPost({required int? id}) {
    final $url = '/auth/${id}/resend';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserModel>> _usersMeGet() {
    final $url = '/users/me';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<UserModel>> _usersIdGet({required int? id}) {
    final $url = '/users/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdDelete(
      {required DeleteUserRequest? deleteUserRequest, required int? id}) {
    final $url = '/users/${id}';
    final $body = deleteUserRequest;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdAdminDelete(
      {required DeleteUserByAdminRequest? deleteUserByAdminRequest,
      required int? id}) {
    final $url = '/users/${id}/admin';
    final $body = deleteUserByAdminRequest;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdUpdatePatch(
      {required int? id, required UserUpdateRequest? userUpdateRequest}) {
    final $url = '/users/${id}/update';
    final $body = userUpdateRequest;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
