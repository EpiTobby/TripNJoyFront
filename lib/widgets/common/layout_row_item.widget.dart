import 'package:flutter/material.dart';

class LayoutRowItem extends StatelessWidget {
  const LayoutRowItem({
    Key? key,
    required this.title,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
          InkWell(onTap: onTap, child: SizedBox(height: 48, width: 48, child: child)),
        ],
      ),
    );
  }
}
