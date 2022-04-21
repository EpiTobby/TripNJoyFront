import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_send_button.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_text_field.widget.dart';

class ChatInput extends HookConsumerWidget {
  const ChatInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ChatTextField(
              controller: controller,
              onAttachFile: () {},
              onAttachImage: () {},
            ),
          ),
          ChatSendButton(onPressed: () {
            if (controller.text.isNotEmpty) {
              logger.d('send button pressed - message: ${controller.text}');
              controller.clear();
            }
          }),
        ],
      ),
    );
  }
}
