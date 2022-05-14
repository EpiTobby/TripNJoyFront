import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class PlanningViewModel extends ChangeNotifier {
  PlanningViewModel(this.httpService);

  final HttpService httpService;

  AsyncValue<List<Activity>> activities = const AsyncValue.loading();

  void getActivities(int groupId) async {
    activities = const AsyncValue.loading();
    notifyListeners();
    final newActivities = await httpService.getActivities(groupId);
    activities = newActivities != null
        ? AsyncValue.data(newActivities.map((e) => Activity.fromActivityResponse(e)).toList())
        : AsyncValue.error(Exception('Failed to get activities'));
    notifyListeners();
  }
}
