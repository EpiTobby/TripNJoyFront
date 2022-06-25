import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';

class BaseFlutterMap extends HookConsumerWidget {
  const BaseFlutterMap({
    Key? key,
    required this.place,
  }) : super(key: key);
  final String place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPosition = useState(LatLng(48.864716, 2.349014));
    return FlutterMap(
      options: MapOptions(
        interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        center: currentPosition.value,
        zoom: 13.0,
        onPositionChanged: (position, hasGesture) {
          if (position.center != currentPosition.value) {
            currentPosition.value = position.center!;
          }
        },
      ),
      children: [
        TileLayerWidget(
          options: TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: ElevatedButton(
            onPressed: () {
              ref.read(planningProvider).getSuggestedActivities(place,
                  GeoPoint(latitude: currentPosition.value.latitude, longitude: currentPosition.value.longitude));
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
              textStyle: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSecondary),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              minimumSize: const Size(0, 0),
            ),
            child: Icon(Icons.search, color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ],
      layers: [
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: currentPosition.value,
              builder: (ctx) => Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
