import 'package:flutter/material.dart';

class LayoutItem extends StatelessWidget {
  const LayoutItem({
    Key? key,
    this.title,
    this.boldTitle = false,
    this.card = true,
    this.cardVariant = false,
    this.actionIcon,
    this.onAction,
    required this.child,
  }) : super(key: key);

  final String? title;
  final bool boldTitle;
  final bool card;
  final bool cardVariant;
  final IconData? actionIcon;
  final void Function()? onAction;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (title != null)
                  Expanded(
                    child: Text(
                      title!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: 16,
                        fontWeight: boldTitle ? FontWeight.bold : FontWeight.w300,
                      ),
                    ),
                  ),
                if (actionIcon != null)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(actionIcon!, color: Theme.of(context).colorScheme.onSecondary),
                      splashRadius: 16,
                      onPressed: onAction,
                    ),
                  ),
              ],
            ),
            child,
          ]),
        ),
      ),
    );
  }
}
