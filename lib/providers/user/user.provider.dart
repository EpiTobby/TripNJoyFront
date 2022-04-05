import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/codegen.provider.dart';

import '../../codegen/api.swagger.dart';
import '../../models/user/user.model.dart';
import '../../services/user/user.service.dart';
import '../auth/auth.provider.dart';

final userProvider = StateNotifierProvider<UserService, AsyncValue<UserModel?>>((ref) {
  final httpService = ref.watch(codegenProvider);
  final authService = ref.watch(authProvider);
  return UserService(httpService, authService);
});
