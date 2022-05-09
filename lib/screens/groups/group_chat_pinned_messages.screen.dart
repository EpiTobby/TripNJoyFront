import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/pinned_messages.provider.dart';

class PinnedMessages extends HookConsumerWidget {
  const PinnedMessages({
    Key? key,
    required this.channelId,
  }) : super(key: key);

  final num channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinnedMessagesViewModel = ref.watch(pinnedMessagesProvider);
    final pinnedMessages = pinnedMessagesViewModel.pinnedMessages;
    final isLoading = pinnedMessagesViewModel.isLoadingMessages;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinned Messages'),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : pinnedMessages.isEmpty
              ? Center(child: Text(AppLocalizations.of(context).translate('groups.chat.pinned_messages.empty')))
              : ListView.builder(
                  itemCount: pinnedMessages.length,
                  itemBuilder: (context, index) {
                    final message = pinnedMessages[index];
                    return ListTile(
                      title: Text(message.content ?? ''),
                      trailing: Text(message.sentDate.toString()),
                    );
                  },
                ),
    );
  }
}
