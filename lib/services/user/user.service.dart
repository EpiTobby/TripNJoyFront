import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../codegen/api.swagger.dart';
import '../api/http.service.dart';

class UserService extends StateNotifier<AsyncValue<UserModel?>> {
  UserService(this.httpService) : super(const AsyncValue.loading());
  final HttpService httpService;
  UserModel? user;

  Future<void> loadUser(String token) async {
    try {
      state = const AsyncLoading();
      var id = httpService.getUserIdFromToken(token);
      user = await httpService
          .loadUser(id)
          .timeout(const Duration(seconds: 10));
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e);
    }
  }

  Future<void> deleteUser(String token) async {
    try {
      state = const AsyncLoading();
      await httpService.deleteUser(token).timeout(const Duration(seconds: 10));
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e);
    }
  }

  Future<void> updateUser(String token, UserUpdateRequest updateRequest) async {
    try {
      state = const AsyncLoading();
      var id = httpService.getUserIdFromToken(token);
      await httpService.updateUser(id!, updateRequest);
      user = await httpService
          .loadUser(id)
          .timeout(const Duration(seconds: 10));
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e);
    }
  }
}
