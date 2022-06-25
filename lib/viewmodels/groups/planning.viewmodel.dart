import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class PlanningViewModel extends ChangeNotifier {
  PlanningViewModel(this.httpService);

  final HttpService httpService;

  AsyncValue<List<Activity>> activities = const AsyncValue.loading();
  AsyncValue<List<String>> places = const AsyncValue.loading();
  AsyncValue<List<PlaceResponse>> suggestedActivities = const AsyncValue.data([]);

  void getActivities(int groupId) async {
    logger.d("Getting activities for group $groupId");
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
    logger.d("Getting places");
    places = const AsyncValue.loading();
    notifyListeners();
    final newPlaces = await httpService.getPlacesCategories();
    places = newPlaces != null ? AsyncValue.data(newPlaces) : AsyncValue.error(Exception('Failed to get places'));
    notifyListeners();
  }

  void getSuggestedActivities(String category, GeoPoint coordinates) async {
    logger.d('Getting suggested activities for category: $category and coordinates: $coordinates');
    suggestedActivities = const AsyncValue.loading();
    notifyListeners();
    final placesCategory = getCategory(category);
    final newSuggestedActivities = await httpService.getSuggestedActivities(PlacesFromCoordinatesRequest(
        categories: [placesCategory],
        latitude: coordinates.latitude.toDouble(),
        longitude: coordinates.longitude.toDouble(),
        radiusMeter: 1000));
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

  Future<Activity?> addActivity(int groupId, CreateActivityRequest createActivityRequest) async {
    final newActivity = await httpService.createActivity(groupId, createActivityRequest);
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

  void clearSuggestedActivities() {
    suggestedActivities = const AsyncValue.data([]);
    notifyListeners();
  }

  Future<Activity?> addSuggestedActivity(int groupId, String category, PlaceResponse activity) async {
    final newActivity = await httpService.createActivity(
        groupId,
        CreateActivityRequest(
          name: activity.name,
          description: category,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          location: "${activity.street}, ${activity.city}, ${activity.country}",
          color: '#${ActivityColors.blue.value.toRadixString(16).substring(2)}',
          icon: getCategoryIcon(getCategory(category)).codePoint.toString(),
        ));
    getActivities(groupId);
    return newActivity != null ? Activity.fromActivityResponse(newActivity) : null;
  }

  CreateActivityRequest getSuggestedActivity(int groupId, String category, PlaceResponse activity) {
    final newActivity = CreateActivityRequest(
      name: activity.name,
      description: category,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      location: "${activity.street}, ${activity.city}, ${activity.country}",
      color: '#${ActivityColors.blue.value.toRadixString(16).substring(2)}',
      icon: getCategoryIcon(getCategory(category)).codePoint.toString(),
    );
    return newActivity;
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

  IconData getCategoryIcon(PlacesFromCoordinatesRequestCategories category) {
    switch (category) {
      case PlacesFromCoordinatesRequestCategories.antiquesShop:
        return Icons.shopping_basket;
      case PlacesFromCoordinatesRequestCategories.artsCenter:
        return Icons.art_track;
      case PlacesFromCoordinatesRequestCategories.artShop:
        return Icons.local_mall;
      case PlacesFromCoordinatesRequestCategories.barAndPub:
        return Icons.local_bar;
      case PlacesFromCoordinatesRequestCategories.beach:
        return Icons.beach_access;
      case PlacesFromCoordinatesRequestCategories.bus:
        return Icons.directions_bus;
      case PlacesFromCoordinatesRequestCategories.change:
        return Icons.swap_horiz;
      case PlacesFromCoordinatesRequestCategories.chineseRestaurant:
        return Icons.restaurant;
      case PlacesFromCoordinatesRequestCategories.coffeeShop:
        return Icons.local_cafe;
      case PlacesFromCoordinatesRequestCategories.entertainment:
        return Icons.local_movies;
      case PlacesFromCoordinatesRequestCategories.fastFood:
        return Icons.fastfood;
      case PlacesFromCoordinatesRequestCategories.fishAndChipsRestaurant:
        return Icons.restaurant;
      case PlacesFromCoordinatesRequestCategories.italianRestaurant:
        return Icons.restaurant;
      case PlacesFromCoordinatesRequestCategories.museum:
        return Icons.museum;
      case PlacesFromCoordinatesRequestCategories.parking:
        return Icons.local_parking;
      case PlacesFromCoordinatesRequestCategories.restaurant:
        return Icons.restaurant;
      case PlacesFromCoordinatesRequestCategories.seafoodRestaurant:
        return Icons.restaurant;
      case PlacesFromCoordinatesRequestCategories.supermarket:
        return Icons.local_grocery_store;
      case PlacesFromCoordinatesRequestCategories.swimmingPool:
        return Icons.pool;
      case PlacesFromCoordinatesRequestCategories.subway:
        return Icons.subway;
      case PlacesFromCoordinatesRequestCategories.theatre:
        return Icons.theaters;
      case PlacesFromCoordinatesRequestCategories.tourism:
        return Icons.local_hotel;
      case PlacesFromCoordinatesRequestCategories.transport:
        return Icons.directions_bus;
      default:
        return Icons.restaurant;
    }
  }
}
