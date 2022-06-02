import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
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
        ? AsyncValue.data(newActivities.map((e) => Activity.fromActivityResponse(e)).toList()
          ..sort((a, b) => a.startDate.compareTo(b.startDate)))
        : AsyncValue.error(Exception('Failed to get activities'));
    notifyListeners();
  }

  Future<Activity?> createDefaultActivity(int groupId) async {
    final newActivity = await httpService.createActivity(
        groupId,
        CreateActivityRequest(
          name: 'Name',
          description: 'Description',
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          location: 'Location',
          color: '#${ActivityColors.blue.value.toRadixString(16).substring(2)}',
          icon: Icons.airplane_ticket.codePoint.toString(),
        ));
    getActivities(groupId);
    return newActivity != null ? Activity.fromActivityResponse(newActivity) : null;
  }

  Future<void> deleteActivity(int groupId, num activityId) async {
    await httpService.deleteActivity(groupId, activityId);
    getActivities(groupId);
  }

  Future<Activity?> updateActivity(int groupId, num activityId, UpdateActivityRequest request) async {
    final activity = await httpService.updateActivity(groupId, activityId, request);
    getActivities(groupId);
    return activity != null ? Activity.fromActivityResponse(activity) : null;
  }

  Future<bool> toggleActivityMember(int groupId, num activityId, num userId, bool join) async {
    final success = await httpService.toggleActivityMember(groupId, activityId, userId, join);
    getActivities(groupId);
    return success;
  }
}
