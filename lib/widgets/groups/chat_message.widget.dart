import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key,
      required this.message,
      required this.username,
      required this.isUser,
      required this.isFirst,
      required this.time,
      this.userAvatar})
      : super(key: key);

  final String message;
  final String username;
  final bool isUser;
  final bool isFirst;
  final DateTime time;
  final String? userAvatar;

  @override
  Widget build(BuildContext context) {
    final header = [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(userAvatar ?? DEFAULT_AVATAR_URL),
          radius: 12,
        ),
      ),
      Text(
        username,
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

    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (isFirst)
          Row(
            mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: isUser ? header.reversed.toList() : header,
          ),
        Padding(
          padding: isUser ? const EdgeInsets.only(right: 32, bottom: 4) : const EdgeInsets.only(left: 32, bottom: 4),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            decoration: BoxDecoration(
                color: isUser ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: isUser
                        ? Theme.of(context).colorScheme.secondary.withOpacity(0.4)
                        : Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                    offset: const Offset(0, 8),
                    blurRadius: 14,
                    spreadRadius: -6,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: isUser ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String formatTimeToMessage(DateTime time) {
  var str = time.hour.toString().padLeft(2, '0') + ':' + time.minute.toString().padLeft(2, '0');
  if (time.day != DateTime.now().day) {
    str += ' - ' + time.day.toString() + '/' + time.month.toString().padLeft(2, '0');
  }
  return str;
}
