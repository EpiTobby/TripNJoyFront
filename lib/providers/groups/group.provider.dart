import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/notification/push_notification.provider.dart';
import 'package:trip_n_joy_front/viewmodels/groups/group.viewmodel.dart';

final groupProvider = ChangeNotifierProvider<GroupViewModel>((ref) {
  final httpService = ref.watch(apiProvider);
  final authViewModel = ref.watch(authProvider);
  final pushNotificationService = ref.watch(pushNotificationProvider);
  return GroupViewModel(httpService, authViewModel, pushNotificationService);
});
