import 'dart:html';

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
  AsyncValue<List<String>> places = const AsyncValue.loading();
  AsyncValue<List<PlaceResponse>> suggestedActivities = const AsyncValue.loading();

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

  void getPlaces() async {
    places = const AsyncValue.loading();
    notifyListeners();
    final newPlaces = await httpService.getPlacesCategories();
    places = newPlaces != null ? AsyncValue.data(newPlaces) : AsyncValue.error(Exception('Failed to get places'));
    notifyListeners();
  }

  void getSuggestedActivities(String category, Coordinates coordinates) async {
    suggestedActivities = const AsyncValue.loading();
    notifyListeners();
    final placesCategory = getCategory(category);
    final newSuggestedActivities = await httpService.getSuggestedActivities(PlacesFromCoordinatesRequest(
        categories: [placesCategory],
        latitude: coordinates.latitude?.toDouble(),
        longitude: coordinates.longitude?.toDouble(),
        radiusMeter: 10000));
    suggestedActivities = newSuggestedActivities != null
        ? AsyncValue.data(newSuggestedActivities)
        : AsyncValue.error(Exception('Failed to get suggested activities'));
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

  PlacesFromCoordinatesRequestCategories getCategory(String category) {
    switch (category) {
      case 'ANTIQUES_SHOP':
        return PlacesFromCoordinatesRequestCategories.antiquesShop;
      case 'ARTS_CENTER':
        return PlacesFromCoordinatesRequestCategories.artsCenter;
      case 'ART_SHOP':
        return PlacesFromCoordinatesRequestCategories.artShop;
      case 'BAR_AND_PUB':
        return PlacesFromCoordinatesRequestCategories.barAndPub;
      case 'BEACH':
        return PlacesFromCoordinatesRequestCategories.beach;
      case 'BUS':
        return PlacesFromCoordinatesRequestCategories.bus;
      case 'CHANGE':
        return PlacesFromCoordinatesRequestCategories.change;
      case 'CHINESE_RESTAURANT':
        return PlacesFromCoordinatesRequestCategories.chineseRestaurant;
      case 'COFFEE_SHOP':
        return PlacesFromCoordinatesRequestCategories.coffeeShop;
      case 'ENTERTAINMENT':
        return PlacesFromCoordinatesRequestCategories.entertainment;
      case 'FAST_FOOD':
        return PlacesFromCoordinatesRequestCategories.fastFood;
      case 'FISH_AND_CHIPS_RESTAURANT':
        return PlacesFromCoordinatesRequestCategories.fishAndChipsRestaurant;
      case 'ITALIAN_RESTAURANT':
        return PlacesFromCoordinatesRequestCategories.italianRestaurant;
      case 'MUSEUM':
        return PlacesFromCoordinatesRequestCategories.museum;
      case 'PARKING':
        return PlacesFromCoordinatesRequestCategories.parking;
      case 'RESTAURANT':
        return PlacesFromCoordinatesRequestCategories.restaurant;
      case 'SEAFOOD_RESTAURANT':
        return PlacesFromCoordinatesRequestCategories.seafoodRestaurant;
      case 'SUPERMARKET':
        return PlacesFromCoordinatesRequestCategories.supermarket;
      case 'SWIMMING_POOL':
        return PlacesFromCoordinatesRequestCategories.swimmingPool;
      case 'SUBWAY':
        return PlacesFromCoordinatesRequestCategories.subway;
      case 'THEATRE':
        return PlacesFromCoordinatesRequestCategories.theatre;
      case 'TOURISM':
        return PlacesFromCoordinatesRequestCategories.tourism;
      case 'TRANSPORT':
        return PlacesFromCoordinatesRequestCategories.transport;
      default:
        return PlacesFromCoordinatesRequestCategories.restaurant;
    }
  }
}
