import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';

class GroupList extends StatelessWidget {
  const GroupList({Key? key, required this.groups}) : super(key: key);

  final List<GroupModel> groups;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: groups.map((group) => GroupListItem(group: group)).toList(),
    );
  }
}

class GroupListItem extends StatelessWidget {
  const GroupListItem({Key? key, required this.group}) : super(key: key);

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const CircleAvatar(backgroundImage: NetworkImage(DEFAULT_AVATAR_URL)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(group.name!),
              const Flexible(
                  child: Text(
                      "Dernier message sur le groupe. Le dernier message du groupe n’apparait pas en entier et est terminé par trois poin... ")),
            ],
          ),
        ],
      ),
    );
  }
}
