import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/screens/groups/chat/group_chat_container.screen.dart';
import 'package:trip_n_joy_front/screens/groups/group_memories.screen.dart';
import 'package:trip_n_joy_front/screens/groups/planning/end_of_trip.screen.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/groups/group_icon.widget.dart';

class GroupList extends StatelessWidget {
  const GroupList({Key? key, required this.groups, this.title}) : super(key: key);

  final List<GroupModel> groups;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ...groups
            .map((group) => GroupListItem(
                  group: group,
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GroupChatContainer(groupId: group.id!.toInt()),
                      ),
                    );
                    if (group.state == GroupModelState.closed &&
                        group.endOfTrip?.add(const Duration(days: 1)).isBefore(DateTime.now()) == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EndOfTrip(groupId: group.id!.toInt()),
                        ),
                      );
                    }
                  },
                ))
            .toList()
      ],
    );
  }
}

class GroupListItem extends StatelessWidget {
  const GroupListItem({Key? key, required this.group, required this.onClick}) : super(key: key);

  final GroupModel group;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onClick();
      },
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: group.state! != GroupModelState.archived
              ? Theme.of(context).colorScheme.surface.withOpacity(0.5)
              : Theme.of(context).disabledColor.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GroupIcon(groupId: group.id!.toInt(), radius: 40,),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.name ?? group.members!.map((e) => e.firstname).join(', '),
                      style: GoogleFonts.raleway(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
