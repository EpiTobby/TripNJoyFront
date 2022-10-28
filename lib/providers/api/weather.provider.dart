import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/api/weather.viewmodel.dart';

final weatherProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(apiProvider);
  return WeatherViewModel(httpService);
});