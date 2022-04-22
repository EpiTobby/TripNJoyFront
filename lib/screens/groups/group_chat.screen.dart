import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_input.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_message.widget.dart';

class GroupChat extends HookConsumerWidget {
  const GroupChat({
    Key? key,
    required this.groupId,
  }) : super(key: key);
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final channel = useState('General');
    final scrollController = useScrollController();
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
                  channel.value,
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => GroupsSettings(groupId: group.id!.toInt())));
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
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  ChatMessage(
                    message: "testMesssage",
                    username: "Tony",
                    isUser: true,
                    isFirst: true,
                    time: DateTime.now().subtract(const Duration(days: 1)),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test",
                    username: "Yakoi",
                    isUser: false,
                    isFirst: true,
                    time: DateTime.now(),
                  ),
                  ChatMessage(
                    message: "Hello world",
                    username: "Yakoi",
                    isUser: false,
                    isFirst: false,
                    time: DateTime.now(),
                  ),
                  ChatMessage(
                    message: "Test for a short messsage",
                    username: "Tony",
                    isUser: true,
                    isFirst: true,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test for a medium messsage that can be send by the user",
                    username: "Tony",
                    isUser: true,
                    isFirst: false,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
                    username: "Tony",
                    isUser: true,
                    isFirst: false,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
                    username: "Tony",
                    isUser: true,
                    isFirst: false,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
                    username: "Tony",
                    isUser: true,
                    isFirst: false,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
                    username: "Tony",
                    isUser: true,
                    isFirst: false,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
                    username: "Tony",
                    isUser: true,
                    isFirst: false,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                  ChatMessage(
                    message: "Test for a long messsage that can be send by the user, it should not overflow the screen",
                    username: "Tony",
                    isUser: true,
                    isFirst: false,
                    time: DateTime.now(),
                    userAvatar:
                        "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                  ),
                ],
              ),
            ),
            ChatInput()
          ],
        ));
  }
}
