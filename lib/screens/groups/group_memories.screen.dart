import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

class GroupMemories extends HookConsumerWidget {
  const GroupMemories({Key? key, required this.groupId, this.memories = const []}) : super(key: key);

  final int groupId;
  final List<String> memories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minioService = ref.watch(minioProvider);
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final memories = groupViewModel.memories[groupId];

    final hasMemories = memories != null && memories.isNotEmpty;

    final selectedMemory = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final imageURL = await minioService.uploadImage();

          if (imageURL != null) {
            groupViewModel.addMemoryToGroup(groupId, imageURL);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasMemories && selectedMemory.value > 0)
            IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 40,
              ),
              onPressed: () {
                selectedMemory.value -= 1;
              },
            ),
          Image.network(
            MinioService.getImageUrl(hasMemories ? memories.elementAt(selectedMemory.value) : group.picture,
                hasMemories ? DEFAULT_URL.IMAGE : DEFAULT_URL.GROUP),
            fit: BoxFit.scaleDown,
            height: double.infinity,
            width: 100,
            //double.infinity,
            alignment: Alignment.center,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          if (hasMemories && selectedMemory.value < memories.length - 1)
            IconButton(
              icon: const Icon(Icons.arrow_forward_rounded, size: 40),
              onPressed: () {
                selectedMemory.value += 1;
              },
            ),
        ],
      ),
    );
  }
}
