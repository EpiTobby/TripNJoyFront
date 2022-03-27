import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

import '../../codegen/api.swagger.dart';
import '../api/http.service.dart';

class UserService extends StateNotifier<AsyncValue<UserModel?>> {
  UserService(this.httpService) : super(const AsyncValue.loading());
  final HttpService httpService;
  UserModel? user;

  Future<UserModel?> loadUser(String token) async {
    try {
      state = const AsyncLoading();
      var id = httpService.getUserIdFromToken(token);
      user = await httpService.loadUser(id).timeout(const Duration(seconds: 10));
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
      user = await httpService.loadUser(id).timeout(const Duration(seconds: 10));
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e);
    }
  }
}
