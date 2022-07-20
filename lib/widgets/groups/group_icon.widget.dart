import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/group_memories.screen.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

class GroupIcon extends HookConsumerWidget {
  const GroupIcon({Key? key, required this.groupId, required this.radius}) : super(key: key);

  final int groupId;
  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final memories = groupViewModel.memories.containsKey(groupId) ? groupViewModel.memories[groupId] ?? [] : const [];

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GroupMemories(groupId: group.id!.toInt()),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (memories.isNotEmpty)
            AnimatedRotation(
              duration: const Duration(seconds: 3600),
              turns: 4,
              child: CircleAvatar(
                radius: radius + 4,
                backgroundImage: const NetworkImage(BACKGROUND_GRADIENT),
              ),
            ),
          CircleAvatar(
              radius: radius,
              backgroundColor: group.state! != GroupModelState.archived
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).disabledColor.withOpacity(0.1),
              backgroundImage: NetworkImage(MinioService.getImageUrl(group.picture, DEFAULT_URL.GROUP))),
        ],
      ),
    );
  }
}
