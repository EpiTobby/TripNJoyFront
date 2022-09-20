import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/notification/push_notification.provider.dart';
import 'package:trip_n_joy_front/viewmodels/user/user.viewmodel.dart';

final userProvider = StateNotifierProvider<UserViewModel, AsyncValue<UserModel?>>((ref) {
  final httpService = ref.watch(apiProvider);
  final authViewModel = ref.watch(authProvider);
  final pushNotificationService = ref.watch(pushNotificationProvider);
  return UserViewModel(httpService, authViewModel, pushNotificationService);
});
