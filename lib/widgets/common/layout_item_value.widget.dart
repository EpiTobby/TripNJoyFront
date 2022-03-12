import 'package:flutter/material.dart';

class LayoutItemValue extends StatelessWidget {
  const LayoutItemValue(
      {Key? key, required this.value, this.icon, this.onPressed})
      : super(key: key);

  final String value;
  final Icon? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(value,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 24)),
        if (icon != null)
          IconButton(splashRadius: 20, icon: icon!, onPressed: onPressed),
      ],
    );
  }
}
