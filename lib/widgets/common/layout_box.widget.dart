import 'package:flutter/material.dart';

class LayoutBox extends StatelessWidget {
  const LayoutBox({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 8),
          child: Divider(
            height: 5,
            thickness: 1,
            color: Theme.of(context).colorScheme.primary.withAlpha(0x33),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Center(
            child: Text(title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, right: 16),
          child: Column(children: children),
        )
      ],
    );
  }
}
