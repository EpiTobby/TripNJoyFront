import 'package:flutter/material.dart';

class StandardCheckbox extends StatelessWidget {
  const StandardCheckbox({Key? key, required this.value, required this.checked, this.onTap}) : super(key: key);
  final String value;
  final bool checked;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: checked ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: checked ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
