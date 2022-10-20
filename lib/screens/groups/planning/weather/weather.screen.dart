import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/weather.provider.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/weather/weather.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/weather/weekly_weather.widget.dart';
import 'package:weather/weather.dart';

class DestinationWeather extends HookConsumerWidget {
  const DestinationWeather({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);
    final weatherViewModel = ref.watch(weatherProvider);
    final weather = weatherViewModel.weather;
    final weeklyWeather = weatherViewModel.weeklyWeather;
    useEffect(() {
      if (group.destination != null) {
        Future.microtask(() => ref.read(weatherProvider).getWeather(group.destination!));
        Future.microtask(() => ref.read(weatherProvider).getWeeklyWeather(group.destination!));
      }
      return null;
    }, [group.destination]);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.weather.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: RefreshIndicator(
        onRefresh: () async {
          weatherViewModel.getWeather(group.destination!);
          weatherViewModel.getWeeklyWeather(group.destination!);
        },
        color: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                width: double.infinity,
                child: AsyncValueWidget<Weather>(
                  value: weather,
                  data: (data) => WeatherData(weather: data, destination: group.destination!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: AsyncValueWidget<List<Weather>>(
                  value: weeklyWeather,
                  data: (weathers) => WeeklyWeather(weathers: weathers),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
