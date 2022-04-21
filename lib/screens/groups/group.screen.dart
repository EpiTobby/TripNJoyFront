import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';

class GroupPage extends StatefulHookConsumerWidget {
  const GroupPage({Key? key, required this.groupId}) : super(key: key);

  final int groupId;

  @override
  ConsumerState createState() => _GroupPageState();
}

class _GroupPageState extends ConsumerState<GroupPage> {
  @override
  Widget build(BuildContext context) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == widget.groupId);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                backgroundImage: NetworkImage(group.picture ?? DEFAULT_GROUP_AVATAR_URL)),
            Text(group.name!, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => GroupsSettings(groupId: group.id!.toInt())));
              }
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text(AppLocalizations.of(context).translate('settings.title')),
                value: 1,
              ),
            ],
          )
        ],
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: const Center(
        child: Text('Group'),
      ),
    );
  }
}
