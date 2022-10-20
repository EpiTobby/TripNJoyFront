import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:weather/weather.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherViewModel(this.httpService);

  final HttpService httpService;

  AsyncValue<Weather> weather = const AsyncValue.loading();

  void getWeather(String destination) async {
    weather = const AsyncValue.loading();
    notifyListeners();
    var response = await httpService.getWeather(destination);
    weather = response != null ? AsyncValue.data(response) : const AsyncValue.error('Failed to get weather');
    notifyListeners();
  }
}
