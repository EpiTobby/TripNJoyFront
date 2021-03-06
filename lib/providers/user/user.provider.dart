import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';

import '../../codegen/api.swagger.dart';
import '../../viewmodels/user/user.viewmodel.dart';
import '../auth/auth.provider.dart';

final userProvider = StateNotifierProvider<UserViewModel, AsyncValue<UserModel?>>((ref) {
  final httpService = ref.watch(apiProvider);
  final authViewModel = ref.watch(authProvider);
  return UserViewModel(httpService, authViewModel);
});
