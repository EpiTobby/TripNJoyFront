import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.enums.swagger.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/screens/groups/planning/add_activity.screen.dart';
import 'package:trip_n_joy_front/screens/groups/planning/edit_activity.screen.dart';
import 'package:trip_n_joy_front/screens/groups/planning/weather/weather.screen.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_empty.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/planning_activity.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/planning_header.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/planning_pill.widget.dart';

class GroupPlanning extends HookConsumerWidget {
  const GroupPlanning({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);
    final scrollController = ScrollController();
    final planningViewModel = ref.watch(planningProvider);
    final activities = planningViewModel.activities;
    useEffect(() {
      Future.microtask(() => ref.read(planningProvider).getActivities(groupId));
    }, [groupId]);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: RefreshIndicator(
        onRefresh: () async {
          planningViewModel.getActivities(groupId);
        },
        color: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          children: [
            PlanningHeader(groupId: group.id!.toInt()),
            if (group.destination != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Row(
                  children: [
                    PlanningPill(
                      label: AppLocalizations.of(context).translate("groups.planning.weather.title"),
                      icon: Icons.wb_cloudy,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DestinationWeather(
                            groupId: groupId,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: PlanningPill(
                        label: AppLocalizations.of(context).translate("groups.planning.news.title"),
                        icon: Icons.newspaper,
                        onTap: () => {},
                      ),
                    ),
                  ],
                ),
              ),
            AsyncValueWidget<List<Activity>>(
              value: activities,
              data: (activities) => activities.isEmpty
                  ? LayoutEmpty(
                      message: AppLocalizations.of(context).translate('groups.planning.empty'),
                      icon: Icons.add_circle_outline,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Column(
                        children: activities
                            .map(
                              (activity) => Column(
                                children: [
                                  PlanningActivity(
                                    prefix: Icon(
                                      activity.icon,
                                      color: Theme.of(context).colorScheme.onSecondary,
                                      size: 64,
                                    ),
                                    title: activity.name,
                                    subtitle: activity.location,
                                    subsubtitle: activity.getActivityDateFormat(),
                                    description: activity.description,
                                    color: activity.color,
                                    members: activity.members.map((e) => e.avatar.url).toList(),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => EditActivity(
                                            activity: activity,
                                            groupId: groupId,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  if (activities.last != activity)
                                    Center(
                                      child: Icon(
                                        Icons.more_vert,
                                        color: Theme.of(context).colorScheme.surface,
                                      ),
                                    ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          group.state != GroupModelState.archived ? FloatingActionButtonLocation.endFloat : null,
      floatingActionButton: group.state != GroupModelState.archived
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddActivity(groupId: groupId)));
              },
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            )
          : null,
    );
  }
}
