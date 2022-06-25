import 'package:flutter/material.dart';

class InputWrap extends StatelessWidget {
  const InputWrap({
    Key? key,
    this.label,
    this.icon,
    this.isError = false,
    required this.child,
  }) : super(key: key);
  final String? label;
  final Icon? icon;
  final bool isError;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 10),
              child: Text(
                label!,
                style: TextStyle(
                  color: isError
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              color: isError
                  ? Theme.of(context).colorScheme.error.withOpacity(0.1)
                  : Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 10),
              child: Row(
                children: [
                  if (icon != null)
                    Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(icon!.icon, color: Theme.of(context).colorScheme.primaryContainer)),
                  Expanded(child: child),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
