import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_member.widget.dart';
import 'package:trip_n_joy_front/widgets/user/user.widget.dart';

class GroupsSettings extends StatefulHookConsumerWidget {
  const GroupsSettings({Key? key, required this.groupId}) : super(key: key);

  final int groupId;

  @override
  ConsumerState createState() => _GroupsSettingsState();
}

class _GroupsSettingsState extends ConsumerState<GroupsSettings> {
  @override
  Widget build(BuildContext context) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == widget.groupId);

    final user = ref.watch(userProvider).value;

    final minioService = ref.watch(minioProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  LayoutHeader(
                    imageURL: group.picture ?? DEFAULT_GROUP_AVATAR_URL,
                    onClick: () async {
                      final imageURL = await minioService.uploadImage();

                      if (imageURL != null) {
                        await groupViewModel.updateGroup(group.id!.toInt(), UpdateGroupRequest(picture: imageURL));
                      }
                    },
                  ),
                  LayoutBox(title: AppLocalizations.of(context).translate("groups.settings.about"), children: [
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.settings.groupName"),
                      child: LayoutItemValue(
                        value: group.name ?? '',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialog(
                                    title: AppLocalizations.of(context).translate("groups.settings.groupName"),
                                    label: AppLocalizations.of(context).translate("groups.settings.groupName"),
                                    initialValue: group.name ?? '',
                                    onConfirm: (value) async {
                                      await groupViewModel.updatePrivateGroup(
                                          group.id!.toInt(), UpdateGroupRequest(name: value));
                                    });
                              });
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.members"),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            ...group.members!.map((member) {
                              return LayoutMember(
                                name: member.firstname! + " " + member.lastname!,
                                imageURL: minioService.getImageUrl(member.profilePicture) ?? DEFAULT_AVATAR_URL,
                                onClick: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return UserDialog(user: member);
                                      });
                                },
                                onDelete: member.id == group.owner?.id
                                    ? null
                                    : () async {
                                        await groupViewModel.removeUserFromGroup(group.id!.toInt(), member.id!.toInt());
                                      },
                              );
                            }).toList(),
                            PrimaryButton(
                                text: '+',
                                fitContent: true,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return InputDialog(
                                            title: AppLocalizations.of(context).translate("groups.addMember"),
                                            label: AppLocalizations.of(context).translate("groups.email"),
                                            initialValue: '',
                                            onConfirm: (value) async {
                                              await groupViewModel.addUserToPrivateGroup(group.id!.toInt(), value);
                                            });
                                      });
                                })
                          ],
                        ),
                      ),
                    ),
                  ]),
                  LayoutBox(title: AppLocalizations.of(context).translate("groups.settings.groupSettings"), children: [
                    if (user != null && group.owner?.id == user.id)
                      LayoutItem(
                          child: LayoutItemValue(
                        value: AppLocalizations.of(context).translate("groups.settings.close"),
                        icon: Icons.lock_outline,
                        onPressed: () {
                          groupViewModel.updateGroup(
                              group.id!.toInt(), UpdateGroupRequest(state: UpdateGroupRequestState.closed));
                        },
                      )),
                    if (user != null && group.owner?.id == user.id)
                      LayoutItem(
                          child: LayoutItemValue(
                        value: AppLocalizations.of(context).translate("groups.settings.archive"),
                        icon: Icons.archive_outlined,
                        onPressed: () {
                          groupViewModel.updateGroup(
                              group.id!.toInt(), UpdateGroupRequest(state: UpdateGroupRequestState.archived));
                        },
                      )),
                    LayoutItem(
                        child: LayoutItemValue(
                      value: AppLocalizations.of(context).translate("groups.settings.quit"),
                      icon: Icons.exit_to_app,
                      customColor: Theme.of(context).colorScheme.error,
                      onPressed: () {
                        groupViewModel.leaveGroup(group.id!.toInt());
                      },
                    )),
                  ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
