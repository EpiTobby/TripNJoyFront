import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/snackbar.widget.dart';

class GroupDialog extends StatefulHookWidget {
  const GroupDialog({Key? key, this.initialValue, this.onConfirm}) : super(key: key);

  final GroupResponse? initialValue;
  final Function? onConfirm;

  @override
  State<GroupDialog> createState() => _GroupDialogState();
}

class _GroupDialogState extends State<GroupDialog> {
  @override
  Widget build(BuildContext context) {
    final name = useState(widget.initialValue?.name ?? '');
    final maxSize = useState(widget.initialValue?.maxSize ?? 0);
    final status = useState<AsyncValue<void>>(const AsyncValue.data(null));

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
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context).translate('groups.settings.groupName'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                child: ListBody(children: [
                  InputField(
                    label: AppLocalizations.of(context).translate('groups.settings.groupName'),
                    onChanged: (newValue) => name.value = newValue,
                    isError: status.value.isError,
                  ),
                  InputField(
                    label: AppLocalizations.of(context).translate('groups.settings.maxSize'),
                    onChanged: (newValue) => maxSize.value = int.tryParse(newValue) ?? 0,
                    isError: status.value.isError,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  ),
                ]),
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
                      await widget.onConfirm!(name.value, maxSize.value);
                      status.value = const AsyncData(null);
                      Navigator.of(context).pop();
                    } on HttpException catch (e) {
                      showErrorSnackBar(context, e.message);
                      status.value = AsyncError(e);
                    }
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
