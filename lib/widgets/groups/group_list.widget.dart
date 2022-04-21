import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/screens/groups/group.screen.dart';

class GroupList extends StatelessWidget {
  const GroupList({Key? key, required this.groups, required this.title}) : super(key: key);

  final List<GroupModel> groups;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(title, style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
        ),
        ...groups.map((group) => GroupListItem(group: group)).toList()],
    );
  }
}

class GroupListItem extends StatelessWidget {
  const GroupListItem({Key? key, required this.group}) : super(key: key);

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GroupPage(groupId: group.id!.toInt()),
          ),
        );
      },
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: group.state! == GroupModelState.open ? Theme.of(context).secondaryHeaderColor : Theme.of(context).disabledColor,
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).colorScheme.background,
                backgroundImage: NetworkImage(group.picture ?? DEFAULT_GROUP_AVATAR_URL)),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.name!,
                      style: GoogleFonts.raleway(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
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
