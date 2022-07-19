import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/date_picker.widget.dart';
import 'package:trip_n_joy_front/widgets/common/snackbar.widget.dart';

class InputDialogDate extends StatefulHookWidget {
  const InputDialogDate({
    Key? key,
    this.title,
    required this.initialStartDate,
    required this.initialEndDate,
    required this.onConfirm,
  }) : super(key: key);

  final String? title;
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final Function onConfirm;

  @override
  State<InputDialogDate> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialogDate> {
  @override
  Widget build(BuildContext context) {
    final selectedStartDate = useState(widget.initialStartDate);
    final selectedEndDate = useState(widget.initialEndDate);
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
                          selectedDate: selectedStartDate.value,
                          maxDate: DateTime(2100),
                          onChanged: (date) => selectedStartDate.value = date,
                          label: AppLocalizations.of(context).translate('common.startDate'),
                        ),
                        DatePicker(
                          selectedDate: selectedEndDate.value,
                          maxDate: DateTime(2100),
                          onChanged: (date) => selectedEndDate.value = date,
                          label: AppLocalizations.of(context).translate('common.endDate'),
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
                        await widget.onConfirm(selectedStartDate.value, selectedEndDate.value);
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
