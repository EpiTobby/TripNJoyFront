import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';
import 'package:trip_n_joy_front/widgets/group_list.widget.dart';

import '../../codegen/api.enums.swagger.dart';

class GroupsPage extends StatefulHookConsumerWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GroupsPageState();
}

class _GroupsPageState extends ConsumerState<GroupsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(groupProvider).groups;
    final groupViewModel = ref.watch(groupProvider);

    final openGroups = groups.where((group) => group.state! == GroupModelState.open).toList();

    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ),
          ),
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: Text('Join a group'), onTap: () {
              groupViewModel.joinPrivateGroup();
            },),
            PopupMenuItem(child: Text('Create a group'), onTap: () {
              groupViewModel.createPrivateGroup("Test", 10);
            },),
          ])
        ],
      ),
      ListView(
        shrinkWrap: true,
        children: [
          openGroups.isNotEmpty ? GroupList(groups: openGroups) : Container(
            padding: const EdgeInsets.all(10),
            child: const Text('No open groups'),
          ),
          GroupList(groups: groups.where((group) => group.state! == GroupModelState.archived).toList()),
        ],
      )
    ]);
  }
}
