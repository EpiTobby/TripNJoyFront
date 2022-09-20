import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/screens/groups/chat/group_chat_pinned_messages.screen.dart';
import 'package:trip_n_joy_front/screens/groups/groups_settings.screen.dart';
import 'package:trip_n_joy_front/screens/groups/planning/group_planning.screen.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_element.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_file.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_header.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_image.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_input.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_message.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_icon.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/planning_activity.widget.dart';

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
    final group = groupViewModel.groups
        .firstWhere((group) => group.id == widget.groupId, orElse: () => groupViewModel.defaultGroupModel);
    final userId = ref.read(userProvider).value?.id;

    final chatViewModel = ref.watch(chatProvider);
    final messages = chatViewModel.messages;
    final isConnected = chatViewModel.isConnectedToSocket;
    final isLoadingMessages = chatViewModel.isLoadingMessages;
    final scrollController = useScrollController();

    final memories =
        groupViewModel.memories.containsKey(widget.groupId) ? groupViewModel.memories[widget.groupId] ?? [] : const [];

    final activities = ref.watch(planningProvider).activities;
    final nextActivity = useState<Activity?>(null);
    useEffect(() {
      Future.microtask(() => ref.read(planningProvider).getActivities(widget.groupId));
    }, [widget.groupId]);

    useEffect(() {
      if (activities.value != null) {
        final now = DateTime.now();
        try {
          nextActivity.value = activities.value?.firstWhere((element) => element.startDate.isAfter(now));
        } catch (e) {
          nextActivity.value = null;
        }
      }
    }, [activities]);

    useEffect(() {
      if (widget.channel != null && isConnected) {
        Future.microtask(() {
          scrollController.addListener(() {
            if (widget.channel != null &&
                scrollController.position.pixels == scrollController.position.maxScrollExtent) {
              chatViewModel.getMessages(widget.groupId, widget.channel!.id);
            }
          });
          _ref.read(chatProvider).changeChannel(widget.groupId, widget.channel!.id);
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GroupIcon(
                groupId: group.id!.toInt(),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name ?? group.members!.map((e) => e.firstname).join(', '),
                        style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      Text(
                        widget.channel?.name ?? '',
                        style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            if (group.owner == null)
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
              color: Theme.of(context).colorScheme.background,
              onSelected: (value) {
                if (value == 1) {
                  _navigator.push(MaterialPageRoute(builder: (_) => GroupsSettings(groupId: group.id!.toInt())));
                }
                if (value == 2 && widget.channel?.id != null) {
                  _navigator.push(
                    MaterialPageRoute(
                      builder: (_) => PinnedMessages(
                        channelId: widget.channel!.id!,
                      ),
                    ),
                  );
                }
                if (value == 3) {
                  _navigator.push(
                    MaterialPageRoute(
                      settings: const RouteSettings(name: "/planning"),
                      builder: (_) => GroupPlanning(
                        groupId: group.id!.toInt(),
                      ),
                    ),
                  );
                }
              },
              itemBuilder: (ctx) => [
                if (group.state == GroupModelState.closed)
                  PopupMenuItem(
                    textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    child: Text(AppLocalizations.of(context).translate('groups.planning.title')),
                    value: 3,
                  ),
                if (widget.channel != null)
                  PopupMenuItem(
                    textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    child: Text(AppLocalizations.of(context).translate('groups.chat.pinned_messages.title')),
                    value: 2,
                  ),
                PopupMenuItem(
                  textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                  child: Text(AppLocalizations.of(context).translate('settings.title')),
                  value: 1,
                ),
              ],
            )
          ],
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            if (nextActivity.value != null)
              PlanningActivity(
                prefix: Icon(
                  nextActivity.value!.icon,
                  color: Theme.of(context).colorScheme.background,
                  size: 64,
                ),
                title: nextActivity.value!.name,
                subtitle: nextActivity.value!.location,
                subsubtitle: nextActivity.value!.getActivityDateFormat(),
                description: nextActivity.value!.description,
                color: nextActivity.value!.color,
                members: nextActivity.value!.members.map((e) => e.avatar.url).toList(),
                onTap: () {
                  _navigator.push(
                    MaterialPageRoute(
                      settings: const RouteSettings(name: "/planning"),
                      builder: (_) => GroupPlanning(
                        groupId: group.id!.toInt(),
                      ),
                    ),
                  );
                },
              ),
            widget.channel == null || isLoadingMessages
                ? const Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: scrollController,
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildChatElement(messages, index, userId);
                      },
                    ),
                  ),
            ChatInput(
              readOnly: group.state == GroupModelState.archived,
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
      if (isFirst) ChatHeader(userId: element.userId!, isUser: isUser, isFirst: isFirst, time: element.sentDate!),
      ChatElement(message: element, isUser: isUser, isPinned: element.pinned!, child: getChatElement(element, isUser))
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
