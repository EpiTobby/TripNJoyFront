import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/screens/groups/planning/edit_activity.screen.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/list_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_empty.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/maps/osm_map.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/planning_activity.widget.dart';

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
    final searchController = useTextEditingController();
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
                LayoutBox(
                  top: true,
                  title: AppLocalizations.of(context).translate('groups.planning.activity.suggestion.map.title'),
                  children: <Widget>[
                    InputField(
                        hint: AppLocalizations.of(context).translate('common.search'),
                        controller: searchController,
                        onEditingComplete: () async {
                          List<SearchInfo> suggestions = await addressSuggestion(searchController.text);
                          showBarModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return ListDialog(
                                items: suggestions,
                                onSelect: (value) async {
                                  if (value.point != null) {
                                    controller.value.changeLocation(value.point!);
                                    controller.value.setZoom(zoomLevel: 14);
                                    ref.read(planningProvider).getSuggestedActivities(place, value.point!);
                                  }
                                },
                              );
                            },
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: OSMMap(controller: controller, place: place),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: LayoutBox(
                      top: true,
                      title: AppLocalizations.of(context).translate("groups.planning.activity.suggestion.title"),
                      children: <Widget>[
                        AsyncValueWidget<List<PlaceResponse>>(
                          value: activities,
                          data: (activities) => activities.isEmpty
                              ? LayoutEmpty(
                                  message: AppLocalizations.of(context)
                                      .translate("groups.planning.activity.suggestion.empty"),
                                  icon: Icons.arrow_circle_up,
                                )
                              : Column(
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
                                            final newActivity = ref
                                                .read(planningProvider)
                                                .getSuggestedActivity(groupId, place, activity);
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
