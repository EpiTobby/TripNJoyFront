import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';

class ChatHeader extends ConsumerWidget {
  const ChatHeader(
      {Key? key,
      required this.userId,
      required this.isUser,
      required this.isFirst,
      required this.time,
      this.userAvatar})
      : super(key: key);

  final num userId;
  final bool isUser;
  final bool isFirst;
  final DateTime time;
  final String? userAvatar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMember = ref.watch(chatProvider).chatMembers[userId];
    final header = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: CircleAvatar(
          backgroundImage: chatMember?.avatar,
          radius: 12,
        ),
      ),
      Text(
        chatMember?.name ?? '',
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Text(
          formatTimeToMessage(time),
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
    ];
    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: isUser ? header.reversed.toList() : header,
    );
  }

  String formatTimeToMessage(DateTime time) {
    var str = time.hour.toString().padLeft(2, '0') + ':' + time.minute.toString().padLeft(2, '0');
    if (time.day != DateTime.now().day) {
      str += ' - ' + time.day.toString() + '/' + time.month.toString().padLeft(2, '0');
    }
    return str;
  }
}
