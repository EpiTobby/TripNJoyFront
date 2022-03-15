import 'package:flutter/material.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({Key? key, this.title, required this.imageURL})
      : super(key: key);

  final String? title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ColoredBox(
              color: Theme.of(context).colorScheme.secondary,
              child: const SizedBox(
                width: double.infinity,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                  radius: 70,
                ),
              ),
            ),
          ],
        ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(title!,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 36,
                    fontWeight: FontWeight.w500)),
          )
      ],
    );
  }
}
