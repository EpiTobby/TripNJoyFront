import 'package:flutter/material.dart';

class LayoutMember extends StatelessWidget {
  const LayoutMember({Key? key, required this.imageURL, required this.name})
      : super(key: key);

  final String imageURL;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imageURL)),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
