import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/common/input_wrap.widget.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.label,
      this.icon,
      required this.selectedValue,
      required this.listValue,
      required this.listLabel,
      required this.onChanged})
      : super(key: key);
  final String label;
  final Icon? icon;
  final String selectedValue;
  final List<String> listValue;
  final List<String> listLabel;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InputWrap(
        label: label,
        icon: icon,
        child: DropdownButton<String>(
            value: getLabelFromValue(selectedValue),
            elevation: 16,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
            onChanged: (String? label) => onChanged(getValueFromLabel(label)),
            underline: Container(color: Colors.transparent),
            items: listLabel.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()));
  }

  String getValueFromLabel(String? label) {
    return label != null ? listValue[listLabel.indexOf(label)] : selectedValue;
  }

  String getLabelFromValue(String? value) {
    return value != null ? listLabel[listValue.indexOf(value)] : selectedValue;
  }
}
