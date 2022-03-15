import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';

import '../api/http.service.dart';
import '../log/logger.service.dart';

class AuthService extends ChangeNotifier {
  AuthService(this.httpService, this.storage) {
    httpService.init();
  }
  final HttpService httpService;
  final FlutterSecureStorage storage;
  String? token;
  static const String tokenKey = 'token';

  AsyncValue<void> loginState = const AsyncValue.data(null);
  AsyncValue<void> signupState = const AsyncValue.data(null);
  AsyncValue<void> verifyAccountState = const AsyncValue.data(null);

  bool get isAuthenticated => token != null;

  Future<String?> login(String email, String password) async {
    loginState = const AsyncValue.loading();
    notifyListeners();
    try {
      var sessionToken = await httpService.login(email, password);
      loginState = const AsyncValue.data(null);
      return await saveToken(sessionToken.token!);
    } catch (e) {
      loginState = AsyncValue.error(
          "Identifiants incorrects"); // TODO: add translations but need to handle call with context
    } finally {
      notifyListeners();
    }
  }

  Future<String?> signup(SignupCredentials data) async {
    logger.i(data.toJson());
    signupState = const AsyncValue.loading();
    notifyListeners();
    try {
      var sessionToken = await httpService.signup(data);
      signupState = const AsyncValue.data(null);
      return await saveToken(sessionToken.token!);
    } catch (e) {
      signupState = AsyncValue.error(
          "Identifiants incorrects"); // TODO: add translations but need to handle call with context
    } finally {
      notifyListeners();
    }
  }

  Future<String?> verifyAccount(String code) async {
    logger.d('confirm code : $code');
    verifyAccountState = const AsyncValue.loading();
    notifyListeners();
    try {
      var sessionToken = await httpService.verifyAccount(code);
      verifyAccountState = const AsyncValue.data(null);
      return await saveToken(sessionToken.token!);
    } catch (e) {
      verifyAccountState = AsyncValue.error(
          "Code incorrect"); // TODO: add translations but need to handle call with context
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await storage.delete(key: tokenKey);
    token = null;
    notifyListeners();
  }

  Future<String> saveToken(String token) async {
    await storage.delete(key: tokenKey);
    await storage.write(key: tokenKey, value: token);
    await updateTokenFromStorage();
    return token;
  }

  Future<String?> updateTokenFromStorage() async {
    token = await storage.read(key: tokenKey);
    notifyListeners();
    return token;
  }
}
