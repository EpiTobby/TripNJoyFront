import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.enums.swagger.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/chat.provider.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_send_button.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/chat/chat_text_field.widget.dart';

class ChatInput extends HookConsumerWidget {
  const ChatInput({
    Key? key,
    required this.groupId,
    required this.channelId,
    required this.onSend,
    this.readOnly = false,
  }) : super(key: key);

  final int groupId;
  final int channelId;
  final void Function(String, MessageResponseType$) onSend;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    final minioService = ref.watch(minioProvider);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Expanded(
                child: ChatTextField(
                  groupId: groupId,
                  channelId: channelId,
                  readOnly: readOnly,
                  controller: controller,
                  onAttachFile: () async {
                    if (readOnly) {
                      return;
                    }

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
                    if (readOnly) {
                      return;
                    }

                    final imageURL = await minioService.uploadImage();
                    if (imageURL != null) {
                      onSend(imageURL, MessageResponseType$.image);
                    }
                  },
                ),
              ),
              if (!readOnly)
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
      ),
    );
  }
}
