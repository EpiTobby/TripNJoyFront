import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

class GroupMemories extends HookConsumerWidget {
  const GroupMemories({Key? key, required this.group, this.memories = const []}) : super(key: key);

  final GroupModel group;
  final List<String> memories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: Image.network(
        MinioService.getImageUrl(group.picture, DEFAULT_URL.GROUP),
        fit: BoxFit.scaleDown,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
