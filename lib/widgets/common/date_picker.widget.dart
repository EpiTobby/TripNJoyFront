import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_n_joy_front/widgets/common/input_wrap.widget.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {Key? key,
      required this.label,
      required this.selectedDate,
      required this.onChanged})
      : super(key: key);
  final String label;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;
  @override
  Widget build(BuildContext context) {
    return InputWrap(
        label: label,
        icon: const Icon(Icons.date_range),
        child: GestureDetector(
          child: Text(DateFormat("EEE d MMM yyyy").format(selectedDate)),
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              lastDate: DateTime(2100),
              firstDate: DateTime(1900),
            );
            if (picked != null && picked != selectedDate) onChanged(picked);
          },
        ));
  }
}
