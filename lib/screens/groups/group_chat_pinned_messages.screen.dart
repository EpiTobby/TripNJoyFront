import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/groups/pinned_messages.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout_empty.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_file.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_header.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_image.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_message.widget.dart';

class PinnedMessages extends HookConsumerWidget {
  const PinnedMessages({
    Key? key,
    required this.channelId,
  }) : super(key: key);

  final num channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() => ref.read(pinnedMessagesProvider).fetchPinnedMessages(channelId));
      return () {};
    }, [channelId]);

    final pinnedMessagesViewModel = ref.watch(pinnedMessagesProvider);
    final pinnedMessages = pinnedMessagesViewModel.pinnedMessages;
    final isLoading = pinnedMessagesViewModel.isLoadingMessages;

    final chatMembers = ref.watch(chatProvider).chatMembers;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("groups.chat.pinned_messages.title")),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : pinnedMessages.isEmpty
              ? Center(
                  child: LayoutEmpty(
                      message: AppLocalizations.of(context).translate('groups.chat.pinned_messages.empty'),
                      icon: Icons.highlight_remove),
                )
              : ListView.builder(
                  itemCount: pinnedMessages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onLongPress: () async {
                          final updatedMessage = await ref
                              .read(pinnedMessagesProvider)
                              .togglePinnedMessage(pinnedMessages[index].id!, false);
                          if (updatedMessage != null) {
                            ref.read(pinnedMessagesProvider).removePinnedMessage(updatedMessage);
                            ref.read(chatProvider).updateMessage(updatedMessage);
                          }
                        },
                        splashColor: Theme.of(context).colorScheme.background,
                        child: buildMessageTile(pinnedMessages[index], chatMembers));
                  },
                ),
    );
  }

  Widget buildMessageTile(MessageResponse message, HashMap<num, ChatMember> chatMembers) {
    if (message.content == null) {
      return Container();
    }

    Widget child = Container();
    switch (message.type) {
      case MessageResponseType$.text:
        child = ChatMessage(message: message.content!, isUser: false);
        break;
      case MessageResponseType$.image:
        child = ChatImage(url: message.content!, isUser: false);
        break;
      case MessageResponseType$.file:
        child = ChatFile(path: message.content!, isUser: false);
        break;
      default:
        return Container();
    }

    final chatMember = chatMembers[message.userId];
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
        child: Text(chatMember?.name ?? ''),
      ),
      subtitle: child,
      trailing: Text(formatTimeToMessage(message.sentDate!)),
    );
  }
}
