import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/common/input/input_wrap.widget.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    Key? key,
    required this.label,
    required this.selectedTime,
    this.isError = false,
    required this.onChanged,
  }) : super(key: key);
  final String label;
  final TimeOfDay selectedTime;
  final bool isError;
  final ValueChanged<TimeOfDay> onChanged;

  @override
  Widget build(BuildContext context) {
    return InputWrap(
      label: label,
      icon: const Icon(Icons.date_range),
      isError: isError,
      child: GestureDetector(
        child: Text(selectedTime.format(context)),
        onTap: () async {
          final TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: selectedTime,
          );
          if (picked != null && picked != selectedTime) onChanged(picked);
        },
      ),
    );
  }
}
