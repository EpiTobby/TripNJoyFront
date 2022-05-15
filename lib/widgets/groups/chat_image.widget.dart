import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';

class ChatImage extends ConsumerWidget {
  const ChatImage({Key? key, required this.url, required this.isUser}) : super(key: key);

  final String url;
  final bool isUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minioService = ref.watch(minioProvider);
    return InkWell(
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
                minioService.getImageUrl(url)!,
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
          image: NetworkImage(minioService.getImageUrl(url)!),
        ),
      ),
    );
  }
}
