import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';

import '../../viewmodels/matchmaking/profile.viewmodel.dart';

final profileProvider = StateNotifierProvider<ProfileViewModel, List<ProfileModel>?>((ref) {
  final httpService = ref.watch(codegenProvider);
  final authViewModel = ref.watch(authProvider);

  return ProfileViewModel(httpService, authViewModel);
});
