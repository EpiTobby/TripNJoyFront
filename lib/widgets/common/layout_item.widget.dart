import 'package:flutter/material.dart';

class LayoutItem extends StatelessWidget {
  const LayoutItem({
    Key? key,
    this.title,
    this.boldTitle = false,
    required this.child,
  }) : super(key: key);

  final String? title;
  final bool boldTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primaryContainer,
              fontSize: 16,
              fontWeight: boldTitle ? FontWeight.bold : FontWeight.w300,
            ),
          ),
        child,
      ]),
    );
  }
}
