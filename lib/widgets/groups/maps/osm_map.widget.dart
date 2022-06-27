import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';

class OSMMap extends HookConsumerWidget {
  const OSMMap({
    Key? key,
    required this.controller,
    required this.place,
  }) : super(key: key);

  final ValueNotifier<MapController> controller;
  final String place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        OSMFlutter(
          controller: controller.value,
          trackMyPosition: true,
          showZoomController: true,
          minZoomLevel: 5,
          maxZoomLevel: 18,
          stepZoom: 1.0,
          isPicker: true,
          userLocationMarker: UserLocationMaker(
            personMarker: MarkerIcon(
              icon: Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.secondary,
                size: 64,
              ),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(
                Icons.double_arrow,
                size: 48,
              ),
            ),
          ),
          markerOption: MarkerOption(
            advancedPickerMarker: MarkerIcon(
              icon: Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.secondary,
                size: 64,
              ),
            ),
            defaultMarker: MarkerIcon(
              icon: Icon(
                Icons.location_on,
                color: Theme.of(context).colorScheme.secondary,
                size: 64,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(8),
              onPressed: () async {
                await controller.value.currentLocation();
                await controller.value.setZoom(zoomLevel: 14);
              },
              icon: Icon(Icons.location_searching, color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(8),
              onPressed: () async {
                final position = await controller.value.centerMap;
                ref.read(planningProvider).getSuggestedActivities(place, position);
              },
              icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Icon(Icons.location_on, color: Theme.of(context).colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
