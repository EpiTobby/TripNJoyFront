import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';
import 'package:trip_n_joy_front/services/api/dio.service.dart';

import '../log/logger.service.dart';

class AuthService extends ChangeNotifier {
  AuthService(this.httpService) {
    httpService.init();
  }
  final HttpService httpService;
  String? token;
  AsyncValue<void> loginState = const AsyncValue.data(null);
  AsyncValue<void> signupState = const AsyncValue.data(null);

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
      return token;
    } catch (e) {
      loginState = AsyncValue.error("Identifiants incorrects");
    } finally {
      notifyListeners();
    }
  }

  Future<String?> signup(SignupCredentials data) async {
    logger.i(data.toJson());
    signupState = const AsyncValue.loading();
    notifyListeners();
    try {
      var response = await httpService.request(
          url: '/auth/signup', method: Method.POST, params: data.toJson());
      signupState = const AsyncValue.data(null);
      token = response['token'];
      return token;
    } catch (e) {
      signupState = AsyncValue.error("Identifiants incorrects");
    } finally {
      notifyListeners();
    }
  }
}
