import 'package:flutter/material.dart';

class LayoutItemValue extends StatelessWidget {
  const LayoutItemValue({
    Key? key,
    required this.value,
    this.editable = true,
    this.icon = Icons.keyboard_arrow_right_sharp,
    this.customColor,
    this.onPressed,
    this.fontSize = 20,
    this.multiline = false,
  }) : super(key: key);

  final String value;
  final Color? customColor;
  final bool editable;
  final IconData icon;
  final double fontSize;
  final bool multiline;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: editable == false ? null : onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              value,
              maxLines: multiline ? 10 : 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customColor ?? Theme.of(context).colorScheme.primary,
                  fontSize: fontSize),
            ),
          ),
          IconButton(
              color: customColor ??
                  (editable == false ? Theme.of(context).colorScheme.shadow : Theme.of(context).colorScheme.primary),
              splashRadius: 16,
              icon: Icon(icon),
              onPressed: editable == false ? () {} : onPressed),
        ],
      ),
    );
  }
}
