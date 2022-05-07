import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_input.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_message.widget.dart';

class GroupChat extends StatefulHookConsumerWidget {
  const GroupChat({
    Key? key,
    required this.groupId,
    required this.channel,
  }) : super(key: key);
  final int groupId;
  final ChannelModel? channel;

  @override
  ConsumerState<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends ConsumerState<GroupChat> {
  @override
  void initState() {
    ref.read(chatProvider).loadWebSocketChannel();
    super.initState();
  }

  @override
  void dispose() {
    ref.read(chatProvider).closeWebSocketChannel();
    ref.read(chatProvider).clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == widget.groupId);

    final chatViewModel = ref.watch(chatProvider);
    final messages = chatViewModel.messages;
    final client = chatViewModel.client;

    final scrollController = useScrollController();
    useEffect(() {
      if (widget.channel != null) {
        ref.read(chatProvider).getMessages(widget.channel!.id);
        logger.i("listening to channel ${widget.channel!.id}");
        client?.subscribe(
          destination: '/topic/response/${widget.channel!.id!}',
          callback: (frame) {
            logger.i('Received message: ${frame.body}');
            ref.read(chatProvider).addMessage(frame.body);
          },
        );
      }
      return () {
        ref.watch(chatProvider).clear();
      };
    }, [widget.channel]);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              splashRadius: 16.0,
              onPressed: () => {Navigator.pop(context)},
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name ?? group.members!.map((e) => e.firstname).join(', '),
                  style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  widget.channel?.name ?? '',
                  style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    group.state! == GroupModelState.closed
                        ? AppLocalizations.of(context).translate('groups.chat.close')
                        : AppLocalizations.of(context).translate('groups.chat.open'),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: group.state! == GroupModelState.closed
                            ? Theme.of(context).colorScheme.tertiary
                            : Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => GroupsSettings(groupId: group.id!.toInt())));
                  }
                },
                itemBuilder: (ctx) => [
                  PopupMenuItem(
                    child: Text(AppLocalizations.of(context).translate('settings.title')),
                    value: 1,
                  ),
                ],
              )
            ],
            foregroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5)),
        body: Column(
          children: [
            widget.channel == null
                ? const Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (messages.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final element = messages[index];
                        return ChatMessage(
                          message: element.content!,
                          username: element.userId!.toString(),
                          isUser: true,
                          isFirst: true,
                          time: element.sentDate!,
                        );
                      },
                    ),
                  ),
            ChatInput(
              onSend: (text) {
                chatViewModel.sendMessage(widget.channel?.id, text);
              },
            )
          ],
        ));
  }
}
