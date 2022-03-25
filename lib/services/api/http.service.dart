import 'package:trip_n_joy_front/services/auth/auth.service.dart';

import '../../codegen/api.swagger.dart';
import '../../models/auth/signup.model.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

abstract class HttpService {
  Future<HttpService> init();

  void initInterceptors();

  Future<UserModel?> loadUser(int? id);

  Future<LoginResponse?> login(String email, String password);

  Future<AuthTokenResponse?> signup(SignupCredentials data);

  Future<bool> verifyAccount(int id, String code);

  Future<void> deleteUser(String token);

  Future<void> updateUser(int id, UserUpdateRequest updateRequest);

  int? getUserIdFromToken(String? token);

  Future<void> forgotPassword(String email);

  Future<UserIdResponse?> resetPassword(String email, String code, String password);

  Future<void> resendVerificationCode(int id);

  Future<void> updatePassword(int id, UpdatePasswordRequest updatePasswordRequest);

  Future<void> updateEmail(int id, UpdateEmailRequest updateEmailRequest);
}
