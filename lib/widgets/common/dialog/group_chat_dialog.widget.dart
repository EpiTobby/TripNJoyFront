import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

class GroupChatDialog extends StatelessWidget {
  const GroupChatDialog({
    Key? key,
    required this.onFile,
    required this.onImage,
    required this.onPoll,
  }) : super(key: key);

  final Function? onFile;
  final Function? onImage;
  final Function? onPoll;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (onImage != null)
                  GroupChatDialogIcon(
                    label: AppLocalizations.of(context).translate("groups.chat.actions.image"),
                    icon: Icons.image,
                    onPressed: onImage!,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                if (onFile != null)
                  GroupChatDialogIcon(
                    label: AppLocalizations.of(context).translate("groups.chat.actions.file"),
                    icon: Icons.attach_file,
                    onPressed: onFile!,
                    color: Theme.of(context).colorScheme.error,
                  ),
                if (onPoll != null)
                  GroupChatDialogIcon(
                    label: AppLocalizations.of(context).translate("groups.chat.actions.poll"),
                    icon: Icons.poll,
                    onPressed: onPoll!,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GroupChatDialogIcon extends StatelessWidget {
  const GroupChatDialogIcon(
      {Key? key, required this.label, required this.icon, required this.onPressed, required this.color})
      : super(key: key);

  final String label;
  final IconData icon;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          constraints: const BoxConstraints(minWidth: 100, minHeight: 100),
          icon: Container(
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 30,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onPressed();
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(color: color, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
