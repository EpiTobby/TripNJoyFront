import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/add_activity.screen.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_activity.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_header.widget.dart';

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
          PlanningHeader(),
          PlanningActivity(
            prefix: Icon(
              Icons.airplane_ticket,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: "Flight Departure",
            subtitle: "Airport CDG",
            subsubtitle: "12/12/2022",
            description: "Go to Terminal 1, take the first flight to CDG, then take the second flight to JFK",
          ),
          Center(
            child: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          PlanningActivity(
            prefix: Icon(
              Icons.beach_access,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: "Beach Time !",
            subtitle: "JFK Beach",
            subsubtitle: "13h30 - 13/12/2022",
            description: "Chill and swim at the beach",
            color: ActivityColors.turquoise,
            members: [DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL, DEFAULT_AVATAR_URL],
          ),
          Center(
            child: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          PlanningActivity(
            prefix: Icon(
              Icons.airplane_ticket,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: "Flight Return",
            subtitle: "Airport JFK",
            subsubtitle: "14/12/2022",
            description: "Go to Terminal 1, take the first flight to CDG, then take the second flight to JFK",
            color: ActivityColors.pink,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddActivity()));
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
