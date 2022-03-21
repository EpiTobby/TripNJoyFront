import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';

import 'button.widget.dart';
import 'input.widget.dart';

class InputDialog extends StatefulHookWidget {
  const InputDialog({
    Key? key,
    this.title,
    required this.label,
    required this.initialValue,
    required this.onConfirm,
    this.isPassword = false
  }) : super(key: key);

  final String? title;
  final String label;
  final String initialValue;
  final Function onConfirm;
  final bool isPassword;

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  @override
  Widget build(BuildContext context) {
    final value = useState(widget.initialValue);
    final status = useState<AsyncValue<void>>(AsyncValue.data(null));
    return AlertDialog(
      title: Center(child: Text(widget.title ?? '', style: TextStyle(color: Theme.of(context).colorScheme.primary))),
      content: InputField(
        isPassword: widget.isPassword,
        label: widget.label,
        onChanged: (newValue) => value.value = newValue,
        isError: status.value.isError,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TertiaryButton(
                text: AppLocalizations.of(context).translate("common.cancel"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              PrimaryButton(
                text: status.value.isError
                    ? AppLocalizations.of(context).translate("common.tryAgain")
                    : AppLocalizations.of(context).translate("common.submit"),
                isLoading: status.value.isLoading,
                onPressed: () async {
                  status.value = AsyncLoading();
                  try {
                    await widget.onConfirm(value.value);
                    status.value = AsyncData(null);
                    Navigator.of(context).pop();
                  } catch (e) {
                    status.value = AsyncError(e);
                  }
                },
                fitContent: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}
