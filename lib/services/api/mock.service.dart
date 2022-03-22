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
  Future<UserModel?> loadUser(int? id) async {
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
  Future<UserModel?> signup(SignupCredentials data) {
    var sessionToken = SessionToken();
    sessionToken.token = "token";
    return Future.delayed(Duration(seconds: 1), () {
      return UserModel();
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
  Future<String> updateFirstname(String token, String firstname) {
    return Future.delayed(Duration(seconds: 1), () {
      return firstname;
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

  Future<UserIdResponse?> resetPassword(String email, String code, String password) async {
    return UserIdResponse(userId: 1);
  }
}
