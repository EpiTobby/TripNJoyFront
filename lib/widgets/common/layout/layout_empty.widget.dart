import 'package:flutter/material.dart';

class LayoutEmpty extends StatelessWidget {
  const LayoutEmpty({Key? key, this.message, this.icon, this.variant}) : super(key: key);

  final String? message;
  final IconData? icon;
  final Color? variant;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 64,
                color: variant ?? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
              ),
            if (message != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: variant ?? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
