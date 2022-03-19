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
  Future<Response<dynamic>> _authForgotpasswordPost(
      {required ForgotPasswordRequest? forgotPasswordRequest}) {
    final $url = '/auth/forgotpassword';
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
  Future<Response<UserModel>> _authRegisterPost(
      {required UserCreationRequest? model}) {
    final $url = '/auth/register';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<UserIdResponse>> _authValidatepasswordPost(
      {required ValidateCodePasswordRequest? validateCodePasswordRequest}) {
    final $url = '/auth/validatepassword';
    final $body = validateCodePasswordRequest;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserIdResponse, UserIdResponse>($request);
  }

  @override
  Future<Response<bool>> _authIdConfirmPatch(
      {required ConfirmationCodeModel? confirmationCode, required int? id}) {
    final $url = '/auth/${id}/confirm';
    final $body = confirmationCode;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<bool, bool>($request);
  }

  @override
  Future<Response<dynamic>> _authIdUpdateemailPatch(
      {required int? id, required UpdateEmailRequest? updateEmailRequest}) {
    final $url = '/auth/${id}/updateemail';
    final $body = updateEmailRequest;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authIdUpdatepasswordPatch(
      {required int? id,
      required UpdatePasswordRequest? updatePasswordRequest}) {
    final $url = '/auth/${id}/updatepassword';
    final $body = updatePasswordRequest;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Object>> _usersGet() {
    final $url = '/users';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<UserModel>> _usersIdGet({required int? id}) {
    final $url = '/users/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
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
