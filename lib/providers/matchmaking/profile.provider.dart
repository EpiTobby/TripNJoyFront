
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/services/matchmaking/profile.service.dart';

final profileProvider = StateNotifierProvider<ProfileService, List<ProfileModel>?>((ref) {
  final httpService = ref.watch(codegenProvider);
  final authService = ref.watch(authProvider);

  return ProfileService(httpService, authService);
});