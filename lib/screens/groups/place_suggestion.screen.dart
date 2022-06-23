import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/screens/groups/edit_activity.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_activity.widget.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class PlaceSuggestion extends HookConsumerWidget {
  const PlaceSuggestion({
    Key? key,
    required this.groupId,
    required this.place,
  }) : super(key: key);

  final int groupId;
  final String place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() => ref.read(planningProvider).clearSuggestedActivities());
    }, [place]);
    final activities = ref.watch(planningProvider).suggestedActivities;
    // final currentPosition = useState(LatLng(48.864716, 2.349014));
    final isLoading = useState(false);
    final controller = useState(MapController());
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("groups.planning.activity.type.$place"),
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(AppLocalizations.of(context).translate('groups.planning.activity.suggestion.map.title'),
                        style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                  ),
                ),
                // map
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Stack(
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
                            directionArrowMarker: MarkerIcon(
                              icon: Icon(
                                Icons.double_arrow,
                                size: 48,
                              ),
                            ),
                          ),
                          markerOption: MarkerOption(
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
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: LayoutBox(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.suggestion.title"),
                      children: <Widget>[
                        AsyncValueWidget<List<PlaceResponse>>(
                          value: activities,
                          data: (activities) => Column(
                            children: activities
                                .map(
                                  (activity) => PlanningActivity(
                                    title: activity.name,
                                    subtitle: activity.street,
                                    subsubtitle: activity.city,
                                    description: activity.country,
                                    color: ActivityColors.getRandomColorFromString(activity.name),
                                    onTap: () async {
                                      isLoading.value = true;
                                      final newActivity =
                                          ref.read(planningProvider).getSuggestedActivity(groupId, place, activity);
                                      isLoading.value = false;

                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (_) =>
                                              EditActivity(groupId: groupId, suggestedActivity: newActivity)));
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
