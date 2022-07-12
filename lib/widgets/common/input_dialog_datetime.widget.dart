import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/widgets/common/date_picker.widget.dart';
import 'package:trip_n_joy_front/widgets/common/snackbar.widget.dart';
import 'package:trip_n_joy_front/widgets/common/time_picker.widget.dart';

import 'button.widget.dart';

class InputDialogDateTime extends StatefulHookWidget {
  const InputDialogDateTime({
    Key? key,
    this.title,
    required this.initialValue,
    required this.onConfirm,
  }) : super(key: key);

  final String? title;
  final DateTime initialValue;
  final Function onConfirm;

  @override
  State<InputDialogDateTime> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialogDateTime> {
  @override
  Widget build(BuildContext context) {
    final selectedDate = useState(widget.initialValue);
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
                  child: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        DatePicker(
                          selectedDate: selectedDate.value,
                          maxDate: DateTime(2100),
                          onChanged: (date) => selectedDate.value = date,
                          label: AppLocalizations.of(context).translate('common.date'),
                        ),
                        TimePicker(
                          selectedTime: TimeOfDay.fromDateTime(selectedDate.value),
                          onChanged: (date) {
                            selectedDate.value = DateTime(
                              selectedDate.value.year,
                              selectedDate.value.month,
                              selectedDate.value.day,
                              date.hour,
                              date.minute,
                            );
                          },
                          label: AppLocalizations.of(context).translate('common.time'),
                        ),
                      ],
                    ),
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
                        await widget.onConfirm(selectedDate.value);
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
