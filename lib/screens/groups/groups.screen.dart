import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';

class GroupsPage extends StatefulHookConsumerWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GroupsPageState();
}

class _GroupsPageState extends ConsumerState<GroupsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final groupViewModel = ref.watch(groupProvider);


    return Column(
      children: [

      ]
    );
  }
}
