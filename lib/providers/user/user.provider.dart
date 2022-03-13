import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/dio.provider.dart';

import '../../models/user/user.model.dart';
import '../../services/user/user.service.dart';

final userProvider =
    StateNotifierProvider.autoDispose<UserService, AsyncValue<User>>((ref) {
  final httpService = ref.watch(dioProvider);
  return UserService(httpService);
});
