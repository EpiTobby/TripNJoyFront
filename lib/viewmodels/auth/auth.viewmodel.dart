import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';

import '../../services/api/http.service.dart';
import '../../services/log/logger.service.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this.httpService, this.storage) {
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
  AsyncValue<void> updatePasswordState = const AsyncValue.data(null);

  bool get isAuthenticated => token != null;

  Future<String?> login(String email, String password) async {
    logger.d("login - $email, $password");
    loginState = const AsyncValue.loading();
    notifyListeners();
    try {
      var sessionToken = await httpService.login(email, password);
      if (sessionToken != null) {
        logger.d("login - success");
        loginState = const AsyncValue.data(null);
        return await saveToken(sessionToken.token!);
      }
      logger.d("login - failed");
      loginState = AsyncValue.error(AppLocalizations.instance.translate("errors.login"));
    } catch (e) {
      logger.e(e.toString(), e);
      loginState = AsyncValue.error(AppLocalizations.instance
          .translate("errors.login")); // not safe as instance could result to null if error on load
    } finally {
      notifyListeners();
    }
  }

  Future<String?> signup(SignupCredentials data) async {
    logger.d("signup - ${data.toJson()}");
    signupState = const AsyncValue.loading();
    notifyListeners();
    try {
      var token = await httpService.signup(data);
      if (token != null) {
        logger.d("signup - success");
        signupState = const AsyncValue.data(null);
        return await saveToken(token.token!);
      }
      logger.d("signup - failed");
      signupState = AsyncValue.error(AppLocalizations.instance.translate("errors.login"));
    } catch (e) {
      logger.e(e.toString(), e);
      signupState = AsyncValue.error(AppLocalizations.instance
          .translate("errors.login")); // not safe as instance could result to null if error on load
    } finally {
      notifyListeners();
    }
  }

  Future<bool?> verifyAccount(String code) async {
    logger.d('verifyAccount - code: $code');
    verifyAccountState = const AsyncValue.loading();
    notifyListeners();
    var userId = httpService.getUserIdFromToken(token);
    try {
      var isVerified = await httpService.verifyAccount(userId!, code);
      verifyAccountState = isVerified
          ? const AsyncValue.data(null)
          : AsyncValue.error(AppLocalizations.instance.translate('errors.wrongCodeConfirmation'));
      logger.d('verifyAccount - isVerified: $isVerified');
      return isVerified;
    } catch (e) {
      logger.e(e.toString(), e);
      verifyAccountState = AsyncValue.error(AppLocalizations.instance.translate('errors.wrongCodeConfirmation'));
    } finally {
      notifyListeners();
    }
  }

  Future<void> resendVerificationCode(int id) async {
    logger.d('resend code to $id');
    verifyAccountState = const AsyncValue.loading();
    notifyListeners();
    try {
      await httpService.resendVerificationCode(id);
      verifyAccountState = const AsyncValue.data(null);
    } catch (e) {
      logger.e(e.toString(), e);
      verifyAccountState = AsyncValue.error(AppLocalizations.instance.translate('errors.unexpected'));
    } finally {
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    logger.d('forgot password - email: $email');
    forgotPasswordState = const AsyncValue.loading();
    notifyListeners();
    try {
      await httpService.forgotPassword(email);
      forgotPasswordState = const AsyncValue.data(null);
      logger.d('forgot password - success');
    } catch (e) {
      logger.e(e.toString(), e);
      forgotPasswordState = AsyncValue.error(AppLocalizations.instance.translate("errors.unexpected"));
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email, String code, String password) async {
    logger.d('reset password - code: $code');
    resetPasswordState = const AsyncValue.loading();
    notifyListeners();
    try {
      await httpService.resetPassword(email, code, password);
      resetPasswordState = const AsyncValue.data(null);
      logger.d('reset password - success');
    } catch (e) {
      logger.e(e.toString(), e);
      resetPasswordState = AsyncValue.error(AppLocalizations.instance.translate("errors.unexpected"));
    } finally {
      notifyListeners();
    }
  }

  Future<void> updatePassword(UpdatePasswordRequest updatePasswordRequest) async {
    logger.d('update password');
    updatePasswordState = const AsyncValue.loading();
    notifyListeners();
    try {
      var id = httpService.getUserIdFromToken(token);
      await httpService.updatePassword(id!, updatePasswordRequest);
      updatePasswordState = const AsyncValue.data(null);
      logout();
    } catch (e) {
      logger.e(e.toString(), e);
      updatePasswordState = AsyncValue.error(AppLocalizations.instance.translate("errors.unexpected"));
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    logger.d("logout");
    await storage.delete(key: tokenKey);
    token = null;
    notifyListeners();
  }

  Future<String> saveToken(String token) async {
    logger.d("saveToken - token: $token");
    await storage.delete(key: tokenKey);
    await storage.write(key: tokenKey, value: token);
    await updateTokenFromStorage();
    return token;
  }

  Future<String?> updateTokenFromStorage() async {
    logger.d("updateTokenFromStorage - updating");
    token = await storage.read(key: tokenKey);
    logger.d("updateTokenFromStorage - success - token: $token");
    notifyListeners();
    return token;
  }
}