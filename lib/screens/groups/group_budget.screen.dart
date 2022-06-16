import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.enums.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';

class GroupBudget extends HookConsumerWidget {
  const GroupBudget({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final group = ref.watch(groupProvider.notifier).groups.firstWhere((group) => group.id == groupId);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            AppLocalizations.of(context).translate('groups.budget.title'),
          ),
        ),
        actions: [
          if (group.state != GroupModelState.archived)
            IconButton(
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onBackground),
              onPressed: () {},
              splashRadius: 16,
            ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
        width: double.infinity,
      ),
    );
  }
}
