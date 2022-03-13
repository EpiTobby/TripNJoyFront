import 'package:flutter/material.dart';

class LayoutItemValue extends StatelessWidget {
  const LayoutItemValue(
      {Key? key, required this.value, this.icon, this.customColor, this.onPressed})
      : super(key: key);

  final String value;
  final Color? customColor;
  final Icon? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
                color: customColor ?? Theme.of(context).colorScheme.primary, fontSize: 24)),
        if (icon != null)
          IconButton(color: customColor ?? Theme.of(context).colorScheme.primary,splashRadius: 20, icon: icon!, onPressed: onPressed),
      ],
    );
  }
}
