import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/dio.provider.dart';

import '../../services/auth/auth.service.dart';

final authProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(dioProvider);
  return AuthService(httpService);
});
final authLoginStateProvider =
    StateProvider((ref) => ref.watch(authProvider).loginState);
final authSignupStateProvider =
    StateProvider((ref) => ref.watch(authProvider).signupState);
