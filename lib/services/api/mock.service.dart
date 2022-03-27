import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/auth/session_token.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/auth/auth.service.dart';

class MockService extends HttpService {
  @override
  Future<HttpService> init() async {
    return this;
  }

  @override
  void initInterceptors() {}

  @override
  Future<UserModel?> loadUser() async {
    return UserModel(
        firstname: "Tony",
        lastname: "Heng",
        email: "tony.heng@epita.fr",
        birthDate: DateTime.now(),
        phoneNumber: "0612345678");
  }

  @override
  Future<LoginResponse?> login(String email, String password) {
    return Future.delayed(Duration(seconds: 1), () {
      return LoginResponse(token: "token", username: "username");
    });
  }

  @override
  Future<AuthTokenResponse?> signup(SignupCredentials data) {
    return Future.delayed(Duration(seconds: 1), () {
      return AuthTokenResponse(token: "token");
    });
  }

  @override
  Future<void> deleteUser(String token) {
    return Future.value();
  }

  @override
  Future<bool> verifyAccount(int id, String code) {
    return Future.delayed(Duration(seconds: 1), () {
      return true;
    });
  }

  @override
  int? getUserIdFromToken(String? token) {
    return 1;
  }

  @override
  Future<void> forgotPassword(String email) async {
    return Future.delayed(Duration(seconds: 1), () {});
  }

  @override
  Future<UserIdResponse?> resetPassword(String email, String code, String password) async {
    return UserIdResponse(userId: 1);
  }

  @override
  Future<void> resendVerificationCode(int id) {
    return Future.delayed(Duration(seconds: 1), () {});
  }

  @override
  Future<void> updateUser(int id, UserUpdateRequest updateRequest) {
    return Future.value();
  }

  @override
  Future<void> updatePassword(int id, UpdatePasswordRequest updatePasswordRequest) {
    return Future.value();
  }

  @override
  Future<LoginResponse?> updateEmail(int id, UpdateEmailRequest updateEmailRequest) {
    return Future.value();
  }
}
