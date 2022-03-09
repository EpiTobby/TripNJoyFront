import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/dio.service.dart';

class AuthService extends ChangeNotifier {
  AuthService(this.httpService);
  final HttpService httpService;
  String? token;
  AsyncValue<void> loginState = const AsyncValue.data(null);

  bool get isAuthenticated => token != null;

  Future<String?> login(String email, String password) async {
    loginState = const AsyncValue.loading();
    notifyListeners();
    try {
      var response = await httpService.request(
          url: '/auth/login',
          method: Method.POST,
          params: {'email': email, 'password': password});
      loginState = const AsyncValue.data(null);
      token = response['token'];
      notifyListeners();
      return token;
    } catch (e) {
      loginState = AsyncValue.error("Identifiants incorrects");
      notifyListeners();
    }
  }
}
