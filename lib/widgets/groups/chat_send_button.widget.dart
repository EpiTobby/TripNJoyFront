import 'package:flutter/material.dart';

class ChatSendButton extends StatelessWidget {
  const ChatSendButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(Icons.send, color: Theme.of(context).colorScheme.background, size: 20),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        primary: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
