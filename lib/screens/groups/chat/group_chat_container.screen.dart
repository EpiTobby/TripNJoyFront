import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlapping_panels/overlapping_panels.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/channel.provider.dart';
import 'package:trip_n_joy_front/screens/groups/budget/group_budget.screen.dart';
import 'package:trip_n_joy_front/screens/groups/chat/group_channel.screen.dart';
import 'package:trip_n_joy_front/screens/groups/chat/group_chat.screen.dart';

class GroupChatContainer extends HookConsumerWidget {
  const GroupChatContainer({
    Key? key,
    required this.groupId,
  }) : super(key: key);
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(channelProvider.notifier).fetchChannels(groupId);
      return null;
    }, []);

    final channels = ref.watch(channelProvider);
    final selectedChannel = useState<ChannelModel?>(null);
    ref.listen<List<ChannelModel>>(channelProvider, (previous, next) {
      if (next.isNotEmpty) {
        selectedChannel.value ??= next[0];
      }
    });

    return Stack(children: [
      channels.isEmpty
          ? Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : OverlappingPanels(
              left: Builder(builder: (context) {
                return GroupChannels(
                    groupId: groupId,
                    channels: channels,
                    selectedChannel: selectedChannel.value,
                    onPressed: (channel) {
                      selectedChannel.value = channel;
                    });
              }),
              main: Builder(builder: (context) {
                return GroupChat(groupId: groupId, channel: selectedChannel.value);
              }),
              right: Builder(builder: (context) {
                return GroupBudget(groupId: groupId);
              }),
            )
    ]);
  }
}
