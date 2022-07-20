import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/widgets/common/input/input_wrap.widget.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key? key,
    required this.label,
    required this.selectedDate,
    this.minDate,
    this.maxDate,
    required this.onChanged,
    this.isError = false,
  }) : super(key: key);
  final String label;
  final DateTime selectedDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final ValueChanged<DateTime> onChanged;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return InputWrap(
      label: label,
      icon: const Icon(Icons.date_range),
      isError: isError,
      child: GestureDetector(
        child: Text(DateFormat("EEE d MMM yyyy", AppLocalizations.of(context).locale.countryCode).format(selectedDate)),
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: minDate == null ? DateTime(1900) : minDate!,
            lastDate: maxDate == null ? DateTime.now() : maxDate!,
          );
          if (picked != null && picked != selectedDate) onChanged(picked);
        },
      ),
    );
  }
}
