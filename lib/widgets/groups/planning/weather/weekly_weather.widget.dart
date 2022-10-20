import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/services/utils/weather.util.dart';
import 'package:weather/weather.dart';

class WeeklyWeather extends StatelessWidget {
  const WeeklyWeather({Key? key, required this.weathers}) : super(key: key);

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: weathers
            .map(
              (weather) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                        spreadRadius: -2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    child: Column(
                      children: [
                        Text(
                          "${weather.date?.day}/${weather.date?.month}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Icon(
                            getWeatherIcon(weather.weatherConditionCode),
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            weather.temperature != null
                                ? weather.temperature!.celsius!.toStringAsFixed(0) + '°C'
                                : AppLocalizations.of(context).translate("groups.planning.weather.empty"),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
