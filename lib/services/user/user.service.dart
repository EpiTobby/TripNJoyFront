import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../../codegen/api.swagger.dart';
import '../../models/user/user.model.dart';
import '../api/http.service.dart';
import '../auth/auth.service.dart';
import '../log/logger.service.dart';

class UserService extends StateNotifier<AsyncValue<UserModel?>> {
  UserService(this.httpService) : super(const AsyncValue.loading());
  final HttpService httpService;
  UserModel? user;

  Future<void> loadUser(String token) async {
    try {
      state = const AsyncLoading();
      final id = AuthService.getUserIdFromToken(token);
      if (id == null) {
        state = const AsyncError('Invalid token');
        return;
      }
      user =
          await httpService.loadUser(id).timeout(const Duration(seconds: 10));
      state = AsyncData(user!);
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
}
