import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user/user.model.dart';
import '../api/http.service.dart';
import '../log/logger.service.dart';

class UserService extends StateNotifier<AsyncValue<User>> {
  UserService(this.httpService) : super(const AsyncValue.loading());
  final HttpService httpService;
  late User user;

  Future<void> loadUser(String token) async {
    try {
      state = const AsyncLoading();
      user = await httpService
          .loadUser(token)
          .timeout(const Duration(seconds: 10));
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e);
    }
  }
}
