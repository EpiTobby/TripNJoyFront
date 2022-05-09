import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/pinned_messages.provider.dart';

class ChatElement extends HookConsumerWidget {
  const ChatElement({
    Key? key,
    required this.message,
    required this.isUser,
    required this.isPinned,
    required this.child,
  }) : super(key: key);

  final MessageResponse message;
  final bool isUser;
  final bool isPinned;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinned = useState(isPinned);
    return Padding(
      padding: isUser ? const EdgeInsets.only(right: 32, bottom: 4) : const EdgeInsets.only(left: 32, bottom: 4),
      child: InkWell(
        onLongPress: () async {
          final updatedMessage = await ref.read(pinnedMessagesProvider).togglePinnedMessage(message.id!, !pinned.value);
          if (updatedMessage?.pinned != null) {
            pinned.value = updatedMessage!.pinned!;
          }
        },
        splashColor: Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isUser && pinned.value) Icon(Icons.push_pin_outlined, color: Theme.of(context).colorScheme.secondary),
            child,
            if (!isUser && pinned.value) Icon(Icons.push_pin_outlined, color: Theme.of(context).colorScheme.secondary),
          ],
        ),
      ),
    );
  }
}
