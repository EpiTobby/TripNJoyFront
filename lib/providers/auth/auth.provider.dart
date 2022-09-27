import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

final authProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(apiProvider);
  return AuthViewModel(httpService, const FlutterSecureStorage());
});
final authLoginStateProvider = StateProvider((ref) => ref.watch(authProvider).loginState);
final authSignupStateProvider = StateProvider((ref) => ref.watch(authProvider).signupState);
final authVerifyAccountStateProvider = StateProvider((ref) => ref.watch(authProvider).verifyAccountState);
final authForgotPasswordStateProvider = StateProvider((ref) => ref.watch(authProvider).forgotPasswordState);
final authResetPasswordStateProvider = StateProvider((ref) => ref.watch(authProvider).resetPasswordState);
