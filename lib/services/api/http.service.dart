import 'package:trip_n_joy_front/models/user/user.model.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

abstract class HttpService {
  Future<HttpService> init();
  void initInterceptors();
  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params});
  Future<User> loadUser(String token);
}
