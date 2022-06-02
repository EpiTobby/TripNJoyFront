import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';

import 'button.widget.dart';
import 'input.widget.dart';

class InputDialogEmail extends StatefulHookWidget {
  const InputDialogEmail({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  final Function onConfirm;

  @override
  State<InputDialogEmail> createState() => _InputDialogPasswordState();
}

class _InputDialogPasswordState extends State<InputDialogEmail> {
  @override
  Widget build(BuildContext context) {
    final newEmail = useState('');
    final password = useState('');
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).translate("settings.email"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                  child: ListBody(
                children: [
                  InputField(
                    label: AppLocalizations.of(context).translate("settings.newEmail"),
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    onChanged: (newValue) => newEmail.value = newValue,
                    isError: status.value.isError,
                  ),
                  InputField(
                    isPassword: true,
                    label: AppLocalizations.of(context).translate("user.password"),
                    onChanged: (newValue) => password.value = newValue,
                    isError: status.value.isError,
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                        status.value = const AsyncLoading();
                        try {
                          await widget.onConfirm(newEmail.value, password.value);
                          status.value = const AsyncData(null);
                          Navigator.of(context).pop();
                        } catch (e) {
                          status.value = AsyncError(e);
                        }
                      },
                      fitContent: true,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
