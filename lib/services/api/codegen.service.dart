import 'package:jwt_decode/jwt_decode.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';

import '../../codegen/api.swagger.dart';
import 'http.service.dart';

const BASE_URL = String.fromEnvironment("BASE_URL");

class CodegenService extends HttpService {
  late Api api;

  static header() => {"Content-Type": "application/json"};

  @override
  Future<HttpService> init() async {
    api = Api.create(baseUrl: BASE_URL);
    initInterceptors();
    return this;
  }

  @override
  void initInterceptors() {}

  @override
  Future<UserModel?> loadUser(int? id) async {
    if (id == null) {
      return null;
    }
    final response = await api.usersIdGet(id: id);
    return response.body;
  }

  @override
  Future<LoginResponse?> login(String email, String password) async {
    final response = await api.authLoginPost(
        loginRequest: LoginRequest(password: password, username: email));
    return response.body;
  }

  @override
  Future<UserModel?> signup(SignupCredentials data) async {
    final response = await api.authRegisterPost(
        model: UserCreationRequest(
      email: data.email,
      password: data.password,
      birthDate: DateTime.parse(data.birthDate),
      firstname: data.firstname,
      lastname: data.lastname,
      phoneNumber: data.phoneNumber,
    ));
    return response.body;
  }

  @override
  Future<void> deleteUser(String token) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyAccount(int id, String code) async {
    final response = await api.authIdConfirmPatch(
        confirmationCode: ConfirmationCodeModel(value: code), id: id);
    return response.isSuccessful ? response.body! : false;
  }

  @override
  Future<String> updateFirstname(String token, String firstname) {
    // TODO: implement updateFirstname
    throw UnimplementedError();
  }

  @override
  int? getUserIdFromToken(String? token) {
    if (token == null) {
      return null;
    }
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    return int.parse(payload['userId']);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await api.authForgotpasswordPost(
        forgotPasswordRequest: ForgotPasswordRequest(email: email));
  }

  @override
  Future<UserIdResponse?> resetPassword(
      String email, String code, String password) async {
    final response = await api.authValidatepasswordPost(
        validateCodePasswordRequest: ValidateCodePasswordRequest(
            email: email, newPassword: password, value: code));
    return response.body;
  }
}
