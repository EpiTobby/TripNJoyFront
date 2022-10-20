import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:weather/weather.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({Key? key, required this.weather, required this.destination}) : super(key: key);

  final Weather weather;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "${weather.date?.day} - ${weather.date?.month} - ${weather.date?.year}",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Text(
            destination.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Text(
            weather.weatherDescription?.toUpperCase() ?? "",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 24,
              letterSpacing: 1.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Text(
            weather.temperature != null
                ? weather.temperature!.celsius!.toStringAsFixed(1) + "°C"
                : AppLocalizations.of(context).translate("groups.planning.weather.empty"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 80,
            ),
          ),
        ),
      ],
    );
  }
}
