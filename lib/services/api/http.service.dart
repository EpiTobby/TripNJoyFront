import 'package:trip_n_joy_front/models/user/user.model.dart';

import '../../models/auth/session_token.model.dart';
import '../../models/auth/signup.model.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

abstract class HttpService {
  Future<HttpService> init();
  void initInterceptors();
  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params});
  Future<User> loadUser(String token);
  Future<SessionToken> login(String email, String password);
  Future<SessionToken> signup(SignupCredentials data);
  Future<SessionToken> verifyAccount(String code);
  Future<void> deleteUser(String token);
}
