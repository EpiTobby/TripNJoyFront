import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';

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
            const CircleAvatar(backgroundImage: NetworkImage(DEFAULT_AVATAR_URL)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.group.name!),
                const Flexible(
                    child: Text(
                        "Dernier message sur le groupe. Le dernier message du groupe n’apparait pas en entier et est terminé par trois poin... ")),
              ],
            ),
          ],
        ),
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: Text("Paramètres"), onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => GroupsSettings(group: widget.group)));
            },),
          ])
        ],
      ),
      body: const Center(
        child: Text('Group'),
      ),
    );
  }
}

