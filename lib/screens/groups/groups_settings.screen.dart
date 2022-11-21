import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/qr_code_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_member.widget.dart';
import 'package:trip_n_joy_front/widgets/user/user.widget.dart';

class GroupsSettings extends HookConsumerWidget {
  const GroupsSettings({Key? key, required this.groupId}) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups
        .firstWhere((group) => group.id == groupId, orElse: () => groupViewModel.defaultGroupModel);

    final isPrivateGroup = group.ownerId != null;
    final minioService = ref.watch(minioProvider);
    final user = ref.watch(userProvider).value;

    if (user == null) {
      return Container();
    }

    final groupInfoModel = useState<GroupInfoModel?>(null);

    useEffect(() {
      Future.microtask(() async {
        groupInfoModel.value = await groupViewModel.getGroupPublicInfo(groupId);
      });
      return () {};
    }, [groupId]);

    if (groupInfoModel.value == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                LayoutHeader(
                  background: true,
                  imageURL: MinioService.getImageUrl(group.picture, DEFAULT_URL.GROUP),
                  onClick: group.state == GroupInfoModelState.archived
                      ? null
                      : () async {
                          final imageURL = await minioService.uploadImage();

                          if (imageURL != null) {
                            if (isPrivateGroup) {
                              await groupViewModel.updatePrivateGroup(
                                  group.id!.toInt(), UpdatePrivateGroupRequest(picture: imageURL));
                            } else {
                              await groupViewModel.updatePublicGroup(
                                  group.id!.toInt(), UpdatePublicGroupRequest(picture: imageURL));
                            }
                          }
                        },
                ),
                LayoutBox(
                  title: AppLocalizations.of(context).translate("groups.settings.about"),
                  children: [
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.settings.groupName"),
                      child: LayoutItemValue(
                        value: group.name ?? '',
                        editable: group.state != GroupInfoModelState.archived && group.ownerId == user.id,
                        onPressed: () {
                          showBarModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialog(
                                    title: AppLocalizations.of(context).translate("groups.settings.groupName"),
                                    label: AppLocalizations.of(context).translate("groups.settings.groupName"),
                                    initialValue: group.name ?? '',
                                    onConfirm: (value) async {
                                      if (isPrivateGroup) {
                                        await groupViewModel.updatePrivateGroup(
                                            group.id!.toInt(), UpdatePrivateGroupRequest(name: value));
                                      } else {
                                        await groupViewModel.updatePublicGroup(
                                            group.id!.toInt(), UpdatePublicGroupRequest(name: value));
                                      }
                                    });
                              });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Chip(
                          label: Text(
                            isPrivateGroup
                                ? AppLocalizations.of(context).translate("groups.settings.private")
                                : AppLocalizations.of(context).translate("groups.settings.public"),
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: isPrivateGroup
                              ? Theme.of(context).colorScheme.tertiary
                              : Theme.of(context).colorScheme.secondary,
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        ),
                        if (!isPrivateGroup)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Chip(
                              label: Text(
                                AppLocalizations.of(context).translate("groups.settings.type.${group.state!.name}"),
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: group.state == GroupInfoModelState.closed
                                  ? Theme.of(context).colorScheme.tertiary
                                  : group.state == GroupInfoModelState.open
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.primary,
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            ),
                          ),
                      ],
                    ),
                    LayoutItem(
                      card: false,
                      title: AppLocalizations.of(context).translate("groups.members"),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            ...groupInfoModel.value!.members!.map((member) {
                              return LayoutMember(
                                name: member.firstname! + " " + member.lastname!,
                                imageURL: MinioService.getImageUrl(member.profilePicture, DEFAULT_URL.AVATAR),
                                onClick: () {
                                  showBarModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return UserDialog(userId: member.userId!.toInt());
                                      });
                                },
                                onDelete: user.id != group.ownerId ||
                                        member.userId == group.ownerId ||
                                        group.state == GroupInfoModelState.archived
                                    ? null
                                    : () async {
                                        await groupViewModel.removeUserFromGroup(group.id!.toInt(), member.userId!.toInt());
                                      },
                              );
                            }).toList(),
                            if (isPrivateGroup && group.state != GroupInfoModelState.archived)
                              PrimaryButton(
                                  text: '+',
                                  fitContent: true,
                                  onPressed: () {
                                    showBarModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return InputDialog(
                                              title: AppLocalizations.of(context).translate("groups.addMember"),
                                              label: AppLocalizations.of(context).translate("groups.email"),
                                              initialValue: '',
                                              textCapitalization: TextCapitalization.none,
                                              onConfirm: (value) async {
                                                await groupViewModel.addUserToPrivateGroup(group.id!.toInt(), value);
                                              });
                                        });
                                  })
                          ],
                        ),
                      ),
                    ),
                    if (isPrivateGroup && group.state != GroupInfoModelState.archived)
                      LayoutItem(
                        child: LayoutItemValue(
                          value: AppLocalizations.of(context).translate("groups.qr_code.generate"),
                          multiline: true,
                          icon: Icons.qr_code,
                          onPressed: () {
                            showBarModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return QRCodeDialog(groupId: groupId);
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
                if (group.state != GroupInfoModelState.archived)
                  LayoutBox(title: AppLocalizations.of(context).translate("groups.settings.groupSettings"), children: [
                    if (!isPrivateGroup && group.state == GroupInfoModelState.open)
                      LayoutItem(
                          child: LayoutItemValue(
                        value: AppLocalizations.of(context).translate("groups.settings.close"),
                        icon: Icons.lock_outline,
                        onPressed: () {},
                      )),
                    if (isPrivateGroup)
                      LayoutItem(
                          child: LayoutItemValue(
                        value: AppLocalizations.of(context).translate("groups.settings.askPublic"),
                        multiline: true,
                        icon: Icons.group_outlined,
                        onPressed: () {},
                      )),
                    if (group.ownerId == user.id)
                      LayoutItem(
                          child: LayoutItemValue(
                        value: AppLocalizations.of(context).translate("groups.settings.archive"),
                        icon: Icons.archive_outlined,
                        onPressed: () {
                          groupViewModel.updatePrivateGroup(group.id!.toInt(),
                              UpdatePrivateGroupRequest(state: UpdatePrivateGroupRequestState.archived));
                        },
                      )),
                    if (!isPrivateGroup)
                      LayoutItem(
                          child: LayoutItemValue(
                        value: AppLocalizations.of(context).translate("groups.settings.askArchive"),
                        icon: Icons.archive_outlined,
                        onPressed: () {},
                      )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: LayoutItem(
                          cardVariant: true,
                          child: LayoutItemValue(
                            value: AppLocalizations.of(context).translate("groups.settings.quit"),
                            icon: Icons.exit_to_app,
                            customColor: Theme.of(context).colorScheme.error,
                            onPressed: () {
                              groupViewModel.leaveGroup(group.id!.toInt()).then((value) {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              });
                            },
                          )),
                    ),
                  ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
