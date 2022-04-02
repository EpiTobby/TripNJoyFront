import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/services/auth/auth.service.dart';

import '../../app_localizations.dart';
import '../../codegen/api.swagger.dart';
import '../api/http.service.dart';

class UserService extends StateNotifier<AsyncValue<UserModel?>> {
  UserService(this.httpService, this.authService) : super(const AsyncValue.loading());
  final HttpService httpService;
  final AuthService authService;
  UserModel? user;

  Future<UserModel?> loadUser() async {
    try {
      state = const AsyncLoading();
      user = await httpService.loadUser().timeout(const Duration(seconds: 10));
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e);
    }
  }

  Future<bool> deleteUser(String token, DeleteUserRequest deleteUserRequest) async {
    try {
      var id = httpService.getUserIdFromToken(token);
      final success = await httpService.deleteUser(id!, deleteUserRequest).timeout(const Duration(seconds: 10));
      if (success) {
        state = const AsyncData(null);
      }
      return success;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateUser(String token, UserUpdateRequest updateRequest) async {
    try {
      state = const AsyncLoading();
      var id = httpService.getUserIdFromToken(token);
      await httpService.updateUser(id!, updateRequest);
      user = await httpService.loadUser().timeout(const Duration(seconds: 10));
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e);
    }
  }

  Future<void> updateEmail(int id, UpdateEmailRequest updateEmailRequest) async {
    try {
      state = const AsyncLoading();
      final loginResponse = await httpService.updateEmail(id, updateEmailRequest);
      if (loginResponse != null && loginResponse.token != null) {
        await authService.logout();
      } else {
        state = AsyncError(Exception(AppLocalizations.instance.translate("errors.unexpected")));
      }
    } catch (e) {
      state = AsyncError(e);
    }
  }
}
