import 'package:flutter/material.dart';

class LayoutItem extends StatelessWidget {
  const LayoutItem({
    Key? key,
    this.title,
    this.boldTitle = false,
    this.card = true,
    this.cardVariant = false,
    required this.child,
  }) : super(key: key);

  final String? title;
  final bool boldTitle;
  final bool card;
  final bool cardVariant;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: card
              ? cardVariant
                  ? Theme.of(context).colorScheme.errorContainer
                  : Theme.of(context).colorScheme.surface.withOpacity(0.5)
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: card ? const EdgeInsets.all(16.0) : const EdgeInsets.all(0.0),
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
        ),
      ),
    );
  }
}
