import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.label,
      required this.selectedValue,
      required this.listValue,
      required this.listLabel,
      required this.onChanged})
      : super(key: key);
  final String label;
  final String selectedValue;
  final List<String> listValue;
  final List<String> listLabel;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 5, left: 10),
                child: Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButton<String>(
                        value: getLabelFromValue(selectedValue),
                        elevation: 16,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        onChanged: (String? label) =>
                            onChanged(getValueFromLabel(label)),
                        items: listLabel
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList())))
          ],
        ));
  }

  String getValueFromLabel(String? label) {
    return label != null ? listValue[listLabel.indexOf(label)] : selectedValue;
  }

  String getLabelFromValue(String? value) {
    return value != null ? listLabel[listValue.indexOf(value)] : selectedValue;
  }
}
