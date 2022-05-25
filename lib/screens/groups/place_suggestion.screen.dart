import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/screens/groups/edit_activity.screen.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_activity.widget.dart';

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
    final currentPosition = useState(LatLng(48.864716, 2.349014));
    final isLoading = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text(place, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView(
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
                    child: FlutterMap(
                      options: MapOptions(
                        interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                        center: currentPosition.value,
                        zoom: 13.0,
                        onPositionChanged: (position, hasGesture) {
                          if (position.center != currentPosition.value) {
                            currentPosition.value = position.center!;
                          }
                        },
                        onLongPress: (position, hasGesture) {
                          ref.read(planningProvider).getSuggestedActivities(place, currentPosition.value);
                        },
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: currentPosition.value,
                              builder: (ctx) => const Icon(Icons.location_on),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                LayoutBox(
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
                                      await ref.read(planningProvider).addSuggestedActivity(groupId, place, activity);
                                  isLoading.value = false;
                                  if (newActivity != null) {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => EditActivity(groupId: groupId, activity: newActivity)));
                                  }
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
