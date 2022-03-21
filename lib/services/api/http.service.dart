import 'package:trip_n_joy_front/services/auth/auth.service.dart';

import '../../codegen/api.swagger.dart';
import '../../models/auth/signup.model.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

abstract class HttpService {
  Future<HttpService> init();

  void initInterceptors();

  Future<UserModel?> loadUser(int? id);

  Future<LoginResponse?> login(String email, String password);

  Future<UserModel?> signup(SignupCredentials data);

  Future<bool> verifyAccount(int id, String code);

  Future<void> deleteUser(String token);

  Future<String> updateFirstname(String token, String firstname);

  int? getUserIdFromToken(String? token);

  Future<void> forgotPassword(String email);

  Future<UserIdResponse?> resetPassword(
      String email, String code, String password);
}