import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.enums.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_send_button.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat_text_field.widget.dart';

class ChatInput extends HookConsumerWidget {
  const ChatInput({
    Key? key,
    required this.onSend,
  }) : super(key: key);

  final void Function(String, MessageResponseType$) onSend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final chatService = ref.watch(chatProvider);
    final minioService = ref.watch(minioProvider);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: ChatTextField(
                controller: controller,
                onAttachFile: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

                  if (result != null) {
                    List<PlatformFile> files = result.files;
                    List<String> paths = [];
                    for (var file in files) {
                      var bytes = Stream.value(File(file.path!).readAsBytesSync());
                      final path = await minioService.upload(file.name, bytes);
                      paths.add(path);
                    }
                    for (var path in paths) {
                      onSend(path.split("?").first, MessageResponseType$.file);
                    }
                  }
                },
                onAttachImage: () async {
                  final imageURL = await minioService.uploadImage();
                  onSend(imageURL!, MessageResponseType$.image);
                },
              ),
            ),
            ChatSendButton(onPressed: () {
              if (controller.text.isNotEmpty) {
                logger.d('send button pressed - message: ${controller.text}');
                onSend(controller.text, MessageResponseType$.text);
                controller.clear();
              }
            }),
          ],
        ),
      ),
    );
  }
}
