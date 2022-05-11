import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key? key, required this.message, required this.isUser}) : super(key: key);

  final String message;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
