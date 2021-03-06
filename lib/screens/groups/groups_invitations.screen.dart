import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_choice.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_list.widget.dart';

class GroupsInvitations extends StatefulHookConsumerWidget {
  const GroupsInvitations({Key? key, required this.groups}) : super(key: key);

  final List<GroupModel> groups;

  @override
  ConsumerState createState() => _GroupsInvitationsState();
}

class _GroupsInvitationsState extends ConsumerState<GroupsInvitations> {
  @override
  Widget build(BuildContext context) {
    final groupsViewModel = ref.watch(groupProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.invitations')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: widget.groups
                    .map((group) => GroupListItem(
                        group: group,
                        onClick: () {
                          showBarModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialogChoice(
                                    title: AppLocalizations.of(context).translate('groups.joinGroupChoice'),
                                    cancelChoice: AppLocalizations.of(context).translate('common.decline'),
                                    confirmChoice: AppLocalizations.of(context).translate('common.accept'),
                                    onConfirm: (value) {
                                      if (value) {
                                        groupsViewModel.joinPrivateGroup(group.id!.toInt());
                                      } else {
                                        groupsViewModel.declineGroupInvitation(group.id!.toInt());
                                      }
                                      widget.groups.remove(group);
                                    });
                              });
                        }))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
