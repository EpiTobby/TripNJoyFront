import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/navbar/navbar.enum.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/screens/groups/invitation/groups_invitations.screen.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/group_list.widget.dart';

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

    final searchText = useState('');
    final searchedOpenGroups = useState<List<GroupModel>>([]);
    final searchedArchivedGroups = useState<List<GroupModel>>([]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("groups.title"),
          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        actions: [
          PopupMenuButton(
            color: Theme.of(context).colorScheme.background,
            onSelected: (selected) async {
              if (selected == 1) {
                showBarModalBottomSheet(
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
                child: Text(
                  AppLocalizations.of(context).translate('groups.create'),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: Text(
                  AppLocalizations.of(context).translate('groups.join'),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                value: 2,
              ),
            ],
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: InputField(
                  textInputAction: TextInputAction.search,
                  onChanged: (text) {
                    searchText.value = text;
                  },
                  onEditingComplete: () async {
                    if (searchText.value.isEmpty) {
                      searchedOpenGroups.value.clear();
                      searchedArchivedGroups.value.clear();
                      return;
                    }

                    searchedOpenGroups.value = openGroups.where((group) {
                      var keywords = searchText.value.split(' ');
                      return keywords.any((element) => group.name!.toLowerCase().contains(element.toLowerCase()));
                    }).toList();
                    searchedArchivedGroups.value = archivedGroups.where((group) {
                      var keywords = searchText.value.split(' ');
                      return keywords.any((element) => group.name!.toLowerCase().contains(element.toLowerCase()));
                    }).toList();
                  },
                  icon: const Icon(Icons.search),
                  hint: AppLocalizations.of(context).translate('common.search'),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: groupViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () async {
                    await groupViewModel.getGroups();
                  },
                  color: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      openGroups.isNotEmpty || searchText.value.isNotEmpty
                          ? GroupList(
                              groups: searchText.value.isNotEmpty ? searchedOpenGroups.value : openGroups,
                            )
                          : Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                                child: Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).translate('groups.noOpenGroup'),
                                      style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onBackground),
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
                      ...(archivedGroups.isNotEmpty || searchText.value.isNotEmpty
                          ? [
                              const Divider(height: 40),
                              GroupList(
                                  title: AppLocalizations.of(context).translate('groups.archived'),
                                  groups: searchText.value.isNotEmpty ? searchedArchivedGroups.value : archivedGroups)
                            ]
                          : [const SizedBox()]),
                    ],
                  ),
                ),
        )
      ]),
    );
  }
}
