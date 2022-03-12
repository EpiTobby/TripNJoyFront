import 'package:flutter/material.dart';

class LayoutItem extends StatelessWidget {
  const LayoutItem({
    Key? key,
    this.title,
    required this.child,
  }) : super(key: key);

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Text(
            title!,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.w300),
          ),
        child,
      ]),
    );
  }
}
