import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_file.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_header.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_image.widget.dart';
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
  late NavigatorState _navigator;
  late WidgetRef _ref;

  @override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    _ref = ref;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == widget.groupId);
    final userId = ref.read(userProvider).value?.id;

    final chatViewModel = ref.watch(chatProvider);
    final messages = chatViewModel.messages;
    final isConnected = chatViewModel.isConnectedToSocket;
    final isLoadingMessages = chatViewModel.isLoadingMessages;

    final scrollController = useScrollController();
    useEffect(() {
      if (widget.channel != null && isConnected) {
        Future.microtask(() {
          _ref.read(chatProvider).getMessages(widget.channel!.id);
          _ref.read(chatProvider).listenToChannel(widget.channel!.id);
        });
      }
    }, [widget.channel, isConnected]);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              splashRadius: 16.0,
              onPressed: () => {_navigator.pop()},
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
                    _navigator.push(MaterialPageRoute(builder: (_) => GroupsSettings(groupId: group.id!.toInt())));
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
            widget.channel == null || isLoadingMessages
                ? const Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildChatElement(messages, index, userId);
                      },
                    ),
                  ),
            ChatInput(
              onSend: (content, type) {
                ref.read(chatProvider).sendMessage(widget.channel?.id, content, type);
              },
            )
          ],
        ));
  }

  bool shouldDisplayHeader(MessageResponse element, List<MessageResponse> messages, int index) {
    final isNotFirst = index != messages.length - 1 &&
        messages[index + 1].userId == element.userId &&
        element.sentDate!.difference(messages[index + 1].sentDate!).inHours < 1;
    return !isNotFirst;
  }

  Widget buildChatElement(List<MessageResponse> messages, int index, num? userId) {
    if (messages.isEmpty) {
      return Container();
    }
    final element = messages[index];
    final isFirst = shouldDisplayHeader(element, messages, index);
    final isUser = element.userId == userId;
    return Column(crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start, children: [
      if (isFirst)
        ChatHeader(username: element.userId.toString(), isUser: isUser, isFirst: isFirst, time: element.sentDate!),
      getChatElement(element, isUser)
    ]);
  }

  Widget getChatElement(MessageResponse element, bool isUser) {
    switch (element.type) {
      case MessageResponseType$.text:
        return ChatMessage(
          message: element.content!,
          isUser: isUser,
        );
      case MessageResponseType$.image:
        return ChatImage(
          url: element.content!,
          isUser: isUser,
        );
      case MessageResponseType$.file:
        return ChatFile(
          path: element.content!,
          isUser: isUser,
        );
      default:
        return Container();
    }
  }
}
