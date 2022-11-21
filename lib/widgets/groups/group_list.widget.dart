import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/chat/group_chat_container.screen.dart';
import 'package:trip_n_joy_front/screens/groups/planning/end_of_trip.screen.dart';
import 'package:trip_n_joy_front/widgets/groups/group_icon.widget.dart';

class GroupList extends StatelessWidget {
  const GroupList({Key? key, required this.groups, this.title}) : super(key: key);

  final List<GroupResponse> groups;
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
                  groupId: group.id!.toInt(),
                  onClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GroupChatContainer(groupId: group.id!.toInt()),
                      ),
                    );
                    if (group.state == GroupInfoModelState.closed &&
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

class GroupListItem extends HookConsumerWidget {
  const GroupListItem({Key? key, required this.groupId, required this.onClick}) : super(key: key);

  final int groupId;
  final Function onClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupService = ref.watch(groupProvider);
    final group = useState<GroupInfoModel?>(null);

    useEffect(() {
      Future.microtask(() async {
        group.value = await groupService.getGroupPublicInfo(groupId);
      });
      return () {};
    }, [groupId]);

    if (group.value == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListTile(
      onTap: () {
        onClick();
      },
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: group.value!.state! != GroupInfoModelState.archived
              ? Theme.of(context).colorScheme.surface.withOpacity(0.5)
              : Theme.of(context).disabledColor.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GroupIcon(
              groupId: group.value!.id!.toInt(),
              radius: 40,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.value!.name ?? group.value!.members!.map((e) => e.firstname).join(', '),
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
