import 'package:flutter/material.dart';

class LayoutMember extends StatelessWidget {
  const LayoutMember({Key? key, required this.imageURL, required this.name, this.onDelete}) : super(key: key);

  final String imageURL;
  final String name;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(imageURL)),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(name),
              ),
            ],
          ),

          if (onDelete != null)
            IconButton(
              color: Theme.of(context).colorScheme.error,
              splashRadius: 20,
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDelete!();
              },
            ),
        ],
      ),
    );
  }
}
