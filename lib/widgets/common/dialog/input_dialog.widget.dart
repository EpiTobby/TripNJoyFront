import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/widgets/common/snackbar.widget.dart';

import '../button.widget.dart';
import '../input/input.widget.dart';

class InputDialog extends StatefulHookWidget {
  const InputDialog({
    Key? key,
    this.title,
    required this.label,
    required this.initialValue,
    required this.onConfirm,
    this.isPassword = false,
    this.multiline = false,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  final String? title;
  final String label;
  final String initialValue;
  final Function onConfirm;
  final bool isPassword;
  final bool multiline;
  final TextCapitalization textCapitalization;

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: widget.initialValue);
    final status = useState<AsyncValue<void>>(const AsyncValue.data(null));
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
      child: Material(
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.title != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputField(
                    isPassword: widget.isPassword,
                    label: widget.label,
                    controller: controller,
                    onChanged: (newValue) => {},
                    isError: status.value.isError,
                    multiline: widget.multiline,
                    textCapitalization: widget.textCapitalization,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                    text: status.value.isError
                        ? AppLocalizations.of(context).translate("common.tryAgain")
                        : AppLocalizations.of(context).translate("common.submit"),
                    isLoading: status.value.isLoading,
                    onPressed: () async {
                      status.value = const AsyncLoading();
                      try {
                        await widget.onConfirm(controller.text);
                        status.value = const AsyncData(null);
                        Navigator.of(context).pop();
                      } on HttpException catch (e) {
                        showErrorSnackBar(context, e.message);
                        status.value = AsyncError(e);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
