import 'package:flutter/material.dart';

class LayoutBox extends StatelessWidget {
  const LayoutBox({
    Key? key,
    required this.title,
    this.top = false,
    required this.children,
  }) : super(key: key);

  final String title;
  final bool top;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: top ? const EdgeInsets.all(0) : const EdgeInsets.only(top: 32),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
                  ),
                ),
              ),
            ),
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
