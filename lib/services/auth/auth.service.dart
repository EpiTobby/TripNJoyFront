import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
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
  AsyncValue<void> forgotPasswordState = const AsyncValue.data(null);
  AsyncValue<void> resetPasswordState = const AsyncValue.data(null);

  bool get isAuthenticated => token != null;

  Future<String?> login(String email, String password) async {
    loginState = const AsyncValue.loading();
    notifyListeners();
    try {
      var sessionToken = await httpService.login(email, password);
      loginState = const AsyncValue.data(null);
      return await saveToken(sessionToken!.token!);
    } catch (e) {
      logger.e(e.toString(), e);
      loginState = AsyncValue.error(AppLocalizations.instance.translate(
          "errors.login")); // not safe as instance could result to null if error on load
    } finally {
      notifyListeners();
    }
  }

  Future<String?> signup(SignupCredentials data) async {
    logger.i(data.toJson());
    signupState = const AsyncValue.loading();
    notifyListeners();
    try {
      var user = await httpService.signup(data);
      if (user != null) {
        signupState = const AsyncValue.data(null);
        return await login(data.email, data.password);
      }
      signupState =
          AsyncValue.error(AppLocalizations.instance.translate("errors.login"));
    } catch (e) {
      logger.e(e.toString(), e);
      signupState = AsyncValue.error(AppLocalizations.instance.translate(
          "errors.login")); // not safe as instance could result to null if error on load
    } finally {
      notifyListeners();
    }
  }

  Future<bool?> verifyAccount(String code) async {
    logger.d('confirm code : $code');
    verifyAccountState = const AsyncValue.loading();
    notifyListeners();
    var userId = httpService.getUserIdFromToken(token);
    try {
      var isVerified = await httpService.verifyAccount(userId!, code);
      verifyAccountState = isVerified
          ? const AsyncValue.data(null)
          : const AsyncValue.error("Code incorrect");
      return isVerified;
    } catch (e) {
      logger.e(e.toString(), e);
      verifyAccountState = AsyncValue.error(
          "Code incorrect"); // TODO: add translations but need to handle call with context
    } finally {
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    logger.d('forgot password : $email');
    forgotPasswordState = const AsyncValue.loading();
    notifyListeners();
    try {
      await httpService.forgotPassword(email);
      forgotPasswordState = const AsyncValue.data(null);
    } catch (e) {
      logger.e(e.toString(), e);
      forgotPasswordState = AsyncValue.error(
          "Une erreur est survenue, veuillez réessayer"); // TODO: add translations but need to handle call with context
    } finally {
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email, String code, String password) async {
    logger.d('reset password : $code');
    resetPasswordState = const AsyncValue.loading();
    notifyListeners();
    try {
      await httpService.resetPassword(email, code, password);
      resetPasswordState = const AsyncValue.data(null);
    } catch (e) {
      logger.e(e.toString(), e);
      resetPasswordState = AsyncValue.error(
          "Une erreur est survenue, veuillez réessayer"); // TODO: add translations but need to handle call with context
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
