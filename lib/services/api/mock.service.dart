import 'package:trip_n_joy_front/models/user/user.model.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class MockService extends HttpService {
  @override
  Future<HttpService> init() async {
    return this;
  }

  @override
  void initInterceptors() {}

  @override
  Future request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) {
    throw UnimplementedError();
  }

  @override
  Future<User> loadUser(String token) async {
    return User(
        id: "1",
        firstname: "Tony",
        lastname: "Heng",
        email: "tony.heng@epita.fr",
        birthDate: DateTime.now(),
        phoneNumber: "0612345678");
  }
}
