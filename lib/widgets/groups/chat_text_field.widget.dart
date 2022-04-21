import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.attach_file,
          color: Theme.of(context).colorScheme.secondary,
        ),
        prefixIconColor: Theme.of(context).colorScheme.secondary,
        suffixIcon: Icon(
          Icons.image_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
        suffixIconColor: Theme.of(context).colorScheme.secondary,
        hintText: AppLocalizations.of(context).translate('groups.chat.hint'),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
