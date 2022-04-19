import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/auth/auth_step.enum.dart';

final authStepProvider = StateNotifierProvider((ref) {
  return AuthStepState();
});

class AuthStepState extends StateNotifier<AuthStep> {
  AuthStepState() : super(AuthStep.LOGIN);

  void signUp() => state = AuthStep.SIGNUP;

  void login() => state = AuthStep.LOGIN;
}
