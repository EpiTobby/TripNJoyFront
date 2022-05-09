import 'package:flutter/material.dart';

class ChatImage extends StatelessWidget {
  const ChatImage({Key? key, required this.url, required this.isUser}) : super(key: key);

  final String url;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isUser ? const EdgeInsets.only(right: 32, bottom: 4) : const EdgeInsets.only(left: 32, bottom: 4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text('Image'),
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                ),
                body: Image.network(
                  url,
                  fit: BoxFit.scaleDown,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
            ),
          );
        },
        splashColor: Theme.of(context).colorScheme.background,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(0.5), width: 1),
          ),
          child: Ink.image(
            fit: BoxFit.cover,
            width: 200,
            height: 200,
            image: NetworkImage(url),
          ),
        ),
      ),
    );
  }
}
