import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/screens/groups/chat/poll/add_poll.screen.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/group_chat_dialog.widget.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField(
      {Key? key,
      required this.groupId,
      required this.channelId,
      required this.controller,
      required this.onAttachFile,
      required this.onAttachImage,
      this.readOnly = false})
      : super(key: key);

  final int groupId;
  final int channelId;
  final TextEditingController controller;
  final Function onAttachFile;
  final Function onAttachImage;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      readOnly: readOnly,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.secondary,
          ),
          splashRadius: 16,
          onPressed: () {
            showBarModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return GroupChatDialog(
                  onFile: onAttachFile,
                  onImage: onAttachImage,
                  onPoll: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AddPoll(groupId: groupId, channelId: channelId),
                    ),
                  ),
                  onQuizz: () {},
                );
              },
            );
          },
        ),
        prefixIconColor: Theme.of(context).colorScheme.secondary,
        hintText: AppLocalizations.of(context).translate('groups.chat.hint'),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.transparent,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
