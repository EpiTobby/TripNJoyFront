import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class NotificationViewModel extends StateNotifier<List<NotificationModel>> {
  NotificationViewModel({required this.httpService}) : super([]);
  final HttpService httpService;

  Future<void> getNotifications() async {
    List<NotificationModel> notifications = await httpService.getNotifications();
    state = notifications + [NotificationModel(title: "Welcome to TripNJoy", body: "We hope you enjoy your trips!")];
  }
}
