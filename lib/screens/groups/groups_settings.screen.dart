import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_member.widget.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Column(
        children: [
          LayoutHeader(
            imageURL: group.picture ?? DEFAULT_GROUP_AVATAR_URL,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              LayoutBox(title: AppLocalizations.of(context).translate("groups.settings.about"), children: [
                LayoutItem(
                  title: AppLocalizations.of(context).translate("groups.settings.groupName"),
                  child: LayoutItemValue(
                    value: group.name!,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return InputDialog(
                                title: AppLocalizations.of(context).translate("groups.settings.groupName"),
                                label: AppLocalizations.of(context).translate("groups.settings.groupName"),
                                initialValue: group.name!,
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
                    child: Column(
                      children: group.members!.map((member) {
                        return LayoutMember(
                          name: member.firstname! + " " + member.lastname!,
                          imageURL: member.profilePicture ?? DEFAULT_AVATAR_URL,
                        );
                      }).toList(),
                    )),
              ]),
              LayoutBox(title: AppLocalizations.of(context).translate("groups.settings.groupSettings"), children: [
                LayoutItem(
                    child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.settings.close"),
                  icon: Icons.lock_outline,
                  onPressed: () {},
                )),
                LayoutItem(
                    child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.settings.archive"),
                  icon: Icons.archive_outlined,
                  onPressed: () {},
                )),
                LayoutItem(
                    child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.settings.quit"),
                  icon: Icons.exit_to_app,
                  customColor: Theme.of(context).colorScheme.error,
                  onPressed: () {},
                )),
              ])
            ],
          ),
        ],
      ),
    );
  }
}
