import 'package:flutter/material.dart';

class ChatImage extends StatelessWidget {
  const ChatImage({Key? key, required this.url}) : super(key: key);

  final String url;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: NetworkImage(url), width: 200, height: 200),
      ],
    );
  }
}