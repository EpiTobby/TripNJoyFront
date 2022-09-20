import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/notification/notification.viewmodel.dart';

final notificationProvider = StateNotifierProvider<NotificationViewModel, List<NotificationModel>>((ref) {
  final httpService = ref.watch(apiProvider);

  return NotificationViewModel(httpService: httpService);
});
