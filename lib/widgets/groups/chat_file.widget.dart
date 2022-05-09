import 'package:flutter/material.dart';

class ChatFile extends StatelessWidget {
  const ChatFile({Key? key, required this.path}) : super(key: key);

  final String path;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print("Tapped");
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[200],
            ),
            child: Text(
              path.split("?").first,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
