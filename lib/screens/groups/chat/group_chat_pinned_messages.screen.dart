import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/groups/pinned_messages.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_empty.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_file.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_header.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_image.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_message.widget.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : pinnedMessages.isEmpty
              ? Center(
                  child: LayoutEmpty(
                      message: AppLocalizations.of(context).translate('groups.chat.pinned_messages.empty'),
                      icon: Icons.highlight_remove),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    await ref.read(pinnedMessagesProvider).fetchPinnedMessages(channelId);
                  },
                  color: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: ListView.builder(
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
                          child: buildMessageTile(context, pinnedMessages[index], chatMembers));
                    },
                  ),
                ),
    );
  }

  Widget buildMessageTile(BuildContext context, MessageResponse message, HashMap<num, ChatMember> chatMembers) {
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
        child: Text(
          chatMember?.name ?? '',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      subtitle: child,
      trailing: Text(
        formatTimeToMessage(message.sentDate!),
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
