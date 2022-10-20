import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:weather/weather.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({Key? key, required this.weather, required this.destination}) : super(key: key);

  final Weather weather;
  final String destination;

  @override
  Widget build(BuildContext context) {
    final icon = getWeatherIcon(weather.weatherConditionCode);
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
          padding: const EdgeInsets.only(top: 48),
          child: Icon(icon, size: 100, color: Theme.of(context).colorScheme.primary),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
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

IconData getWeatherIcon(int? code) {
  switch (code) {
    case 200:
    case 201:
    case 202:
    case 210:
    case 211:
    case 212:
    case 221:
    case 230:
    case 231:
    case 232:
      return Icons.bolt;
    case 300:
    case 301:
    case 302:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 321:
      return Icons.foggy;
    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
    case 511:
    case 520:
    case 521:
    case 522:
    case 531:
      return Icons.water_drop;
    case 600:
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 620:
    case 621:
    case 622:
      return Icons.cloudy_snowing;
    case 701:
    case 711:
    case 721:
    case 731:
    case 741:
    case 751:
    case 761:
    case 762:
    case 771:
    case 781:
      return Icons.wb_cloudy;
    case 800:
      return Icons.wb_sunny;
    case 801:
    case 802:
    case 803:
    case 804:
      return Icons.wb_cloudy;
    default:
      return Icons.wb_cloudy;
  }
}
