import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.enums.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/screens/groups/add_activity.screen.dart';
import 'package:trip_n_joy_front/screens/groups/edit_activity.screen.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_activity.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_header.widget.dart';

import '../../models/group/activity.dart';

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
    final activities = ref.watch(planningProvider).activities;
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
      body: ListView(
        controller: scrollController,
        children: [
          PlanningHeader(group: group),
          AsyncValueWidget<List<Activity>>(
            value: activities,
            data: (activities) => Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Column(
                children: activities
                    .map(
                      (activity) => Column(
                        children: [
                          PlanningActivity(
                            prefix: Icon(
                              activity.icon,
                              color: Theme.of(context).colorScheme.background,
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
