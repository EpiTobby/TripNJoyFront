import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/dio.provider.dart';

import '../../services/auth/auth.service.dart';

final authProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(dioProvider);
  return AuthService(httpService, const FlutterSecureStorage());
});
final authLoginStateProvider =
    StateProvider((ref) => ref.watch(authProvider).loginState);
final authSignupStateProvider =
    StateProvider((ref) => ref.watch(authProvider).signupState);
