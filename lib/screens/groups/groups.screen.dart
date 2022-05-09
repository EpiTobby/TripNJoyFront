import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/navbar/navbar.enum.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/screens/groups/groups_invitations.screen.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_list.widget.dart';

import '../../codegen/api.enums.swagger.dart';

class GroupsPage extends StatefulHookConsumerWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GroupsPageState();
}

class _GroupsPageState extends ConsumerState<GroupsPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final navbarProvider = ref.watch(navbarStateProvider.notifier);

    final groups = ref.watch(groupProvider).groups;
    final groupViewModel = ref.watch(groupProvider);

    final openGroups = groups.where((group) => group.state! != GroupModelState.archived).toList();
    final archivedGroups = groups.where((group) => group.state! == GroupModelState.archived).toList();

    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: AppLocalizations.of(context).translate('common.search'),
                ),
              ),
            ),
          ),
          PopupMenuButton(
            onSelected: (selected) async {
              if (selected == 1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return GroupDialog(
                        onConfirm: (name, maxSize) {
                          groupViewModel.createPrivateGroup(name, maxSize);
                        },
                      );
                    });
              } else if (selected == 2) {
                final groupInvitations = await groupViewModel.getUserInvitesGroups();
                Navigator.push(context, MaterialPageRoute(builder: (_) => GroupsInvitations(groups: groupInvitations)));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(AppLocalizations.of(context).translate('groups.create')),
                value: 1,
              ),
              PopupMenuItem(
                child: Text(AppLocalizations.of(context).translate('groups.join')),
                value: 2,
              ),
            ],
          )
        ],
      ),
      Expanded(
        child: groupViewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                shrinkWrap: true,
                children: [
                  openGroups.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GroupList(
                              groups: openGroups, title: AppLocalizations.of(context).translate('groups.open')),
                        )
                      : Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                            child: Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate('groups.noOpenGroup'),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(height: 20),
                                PrimaryButton(
                                    text: AppLocalizations.of(context).translate('profile.create'),
                                    onPressed: () {
                                      navbarProvider.navigate(NavbarPage.MATCHMAKING);
                                    })
                              ],
                            ),
                          ),
                        ),
                  ...(archivedGroups.isNotEmpty
                      ? [
                          const Divider(height: 40),
                          GroupList(
                              title: AppLocalizations.of(context).translate('groups.archived'), groups: archivedGroups)
                        ]
                      : [const SizedBox()]),
                ],
              ),
      )
    ]);
  }
}
