import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:trip_n_joy_front/models/auth/signInUpGoogle.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';

import '../../codegen/api.swagger.dart';
import '../auth/auth.service.dart';
import 'http.service.dart';

const BASE_URL = String.fromEnvironment("BASE_URL", defaultValue: "http://localhost:8080");

class CodegenService extends HttpService {
  late Api api;
  final FlutterSecureStorage storage;

  CodegenService(this.storage);

  static header() => {"Content-Type": "application/json"};

  @override
  Future<HttpService> init() async {
    api = Api.create(
        client: ChopperClient(
            converter: $JsonSerializableConverter(),
            interceptors: [
              (Request request) async => applyHeader(
                  request, 'authorization', "Bearer " + (await storage.read(key: AuthService.tokenKey) ?? ""),
                  override: false),
              (Response response) async {
                if (response.statusCode == 401) {
                  await storage.delete(key: AuthService.tokenKey);
                }
                return response;
              }
            ],
            baseUrl: BASE_URL),
        baseUrl: BASE_URL);
    initInterceptors();
    return this;
  }

  @override
  void initInterceptors() {}

  @override
  Future<UserModel?> loadUser() async {
    final response = await api.usersMeGet();
    return response.body;
  }

  @override
  Future<LoginResponse?> login(String email, String password) async {
    final response = await api.authLoginPost(body: LoginRequest(password: password, username: email));
    return response.body;
  }

  @override
  Future<AuthTokenResponse?> signup(SignupCredentials data) async {
    final response = await api.authRegisterPost(
        body: UserCreationRequest(
      gender: data.gender,
      email: data.email,
      password: data.password,
      birthDate: DateTime.parse(data.birthDate),
      firstname: data.firstname,
      lastname: data.lastname,
      phoneNumber: data.phoneNumber,
      city: data.city,
      language: data.language,
    ));
    return response.body;
  }

  @override
  Future<bool> deleteUser(int id, DeleteUserRequest deleteUserRequest) async {
    final response = await api.usersIdDelete(body: deleteUserRequest, id: id);

    return response.isSuccessful;
  }

  @override
  Future<bool> verifyAccount(int id, String code) async {
    final response = await api.authIdConfirmationPatch(body: ConfirmationCodeModel(value: code), id: id);
    return response.isSuccessful;
  }

  @override
  int? getUserIdFromToken(String? token) {
    if (token == null) {
      return null;
    }
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    var id = payload['userId'];

    if (id.runtimeType == int) {
      return id;
    }

    return int.parse(id);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await api.authForgotPasswordPost(body: ForgotPasswordRequest(email: email));
  }

  @override
  Future<UserIdResponse?> resetPassword(String email, String code, String password) async {
    final response = await api.authValidationPasswordPatch(
        body: ValidateCodePasswordRequest(email: email, newPassword: password, value: code));
    return response.body;
  }

  @override
  Future<void> resendVerificationCode(int id) async {
    await api.authIdResendPost(id: id);
  }

  @override
  Future<void> updateUser(int id, UserUpdateRequest updateRequest) async {
    await api.usersIdUpdatePatch(id: id, body: updateRequest);
  }

  @override
  Future<LoginResponse?> updateEmail(int id, UpdateEmailRequest updateEmailRequest) async {
    final response = await api.authIdEmailPatch(id: id, body: updateEmailRequest);
    return response.body;
  }

  @override
  Future<void> updatePassword(int id, UpdatePasswordRequest updatePasswordRequest) async {
    await api.authIdPasswordPatch(id: id, body: updatePasswordRequest);
  }

  @override
  Future<GoogleAuthResponse?> signInUpGoogle(SignInUpGoogleCredentials data) async {
    final response = await api.authGooglePost(
        body: GoogleRequest(
            email: data.email,
            firstname: data.firstname,
            lastname: data.lastname,
            phoneNumber: data.phoneNumber,
            profilePicture: data.profilePicture,
            accessToken: data.accessToken));

    return response.body;
  }
}
