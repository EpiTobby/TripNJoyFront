import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlapping_panels/overlapping_panels.dart';
import 'package:trip_n_joy_front/screens/groups/group_channel.screen.dart';
import 'package:trip_n_joy_front/screens/groups/group_chat.screen.dart';

class GroupChatContainer extends HookConsumerWidget {
  const GroupChatContainer({
    Key? key,
    required this.groupId,
  }) : super(key: key);
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ["General", "Food", "Travel", "Shopping"];
    final selectedChannel = useState(channels[0]);
    return Stack(children: [
      OverlappingPanels(
        left: Builder(builder: (context) {
          return GroupChannels(
              channels: channels,
              selectedChannel: selectedChannel.value,
              onPressed: (channel) {
                selectedChannel.value = channel;
              });
        }),
        main: Builder(builder: (context) {
          return GroupChat(groupId: groupId);
        }),
        right: Builder(builder: (context) {
          return Container();
        }),
      )
    ]);
  }
}
