import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class GroupPage extends StatefulHookConsumerWidget {
  const GroupPage({Key? key, required this.group}) : super(key: key);

  final GroupModel group;

  @override
  ConsumerState createState() => _GroupPageState();
}

class _GroupPageState extends ConsumerState<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
                backgroundImage: NetworkImage(widget.group.picture ?? DEFAULT_GROUP_AVATAR_URL)),
            Text(widget.group.name!, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => GroupsSettings(group: widget.group)));
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
