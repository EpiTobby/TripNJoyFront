import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField(
      {Key? key,
      required this.controller,
      required this.onAttachFile,
      required this.onAttachImage,
      this.readOnly = false})
      : super(key: key);

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
            Icons.attach_file,
            color: Theme.of(context).colorScheme.secondary,
          ),
          splashRadius: 16,
          onPressed: () {
            onAttachFile();
          },
        ),
        prefixIconColor: Theme.of(context).colorScheme.secondary,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.image_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
          splashRadius: 16,
          onPressed: () {
            onAttachImage();
          },
        ),
        suffixIconColor: Theme.of(context).colorScheme.secondary,
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
