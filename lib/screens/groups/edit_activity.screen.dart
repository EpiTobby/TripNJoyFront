import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_choice.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_date.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_activity.widget.dart';

import '../../constants/common/colors.style.dart';

class EditActivity extends HookConsumerWidget {
  const EditActivity({
    Key? key,
    required this.groupId,
    required this.activity,
  }) : super(key: key);

  final int groupId;
  final Activity activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planningViewModel = ref.watch(planningProvider);
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.activity.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        actions: [
          IconButton(
            splashRadius: 16,
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName("/planning"));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          PlanningActivity(
            prefix: Icon(
              activity.icon,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: activity.name ?? '',
            subtitle: activity.location ?? '',
            subsubtitle: activity.getActivityDateFormat(),
            description: activity.description ?? '',
            color: activity.color,
          ),
          Expanded(
            child: ListView(
              children: [
                LayoutBox(
                  title: AppLocalizations.of(context).translate("groups.planning.activity.edit.title"),
                  children: <Widget>[
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                      child: LayoutItemValue(
                        value: activity.name ?? '',
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                                initialValue: activity.name ?? '',
                                onConfirm: (value) async {
                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(name: value));
                                  if (newActivity != null) {
                                    activity.name = newActivity.name;
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.location.title"),
                      child: LayoutItemValue(
                        value: activity.location ?? '',
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.title"),
                                initialValue: activity.location ?? '',
                                onConfirm: (value) async {
                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(location: value));
                                  if (newActivity != null) {
                                    activity.location = newActivity.location;
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.title"),
                      child: LayoutItemValue(
                        value: DateFormat("HH:mm - dd/MM/yyyy").format(activity.startDate),
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialogDate(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.edit"),
                                initialValue: activity.startDate,
                                onConfirm: (value) async {
                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(startDate: value));
                                  if (newActivity != null) {
                                    activity.startDate = newActivity.startDate;
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.end.title"),
                      child: LayoutItemValue(
                        value: DateFormat("HH:mm - dd/MM/yyyy").format(activity.endDate),
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialogDate(
                                title: AppLocalizations.of(context).translate("groups.planning.activity.edit.end.edit"),
                                initialValue: activity.endDate,
                                onConfirm: (value) async {
                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(endDate: value));
                                  if (newActivity != null) {
                                    activity.endDate = newActivity.endDate;
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.description.title"),
                      child: LayoutItemValue(
                        value: activity.description ?? '',
                        multiline: true,
                        fontSize: 20,
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.title"),
                                initialValue: activity.description ?? '',
                                multiline: true,
                                onConfirm: (value) async {
                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(description: value));
                                  if (newActivity != null) {
                                    activity.description = newActivity.description;
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.icon.title"),
                            child: Icon(
                              activity.icon,
                              size: 48,
                            ),
                            onTap: () async {
                              IconData? icon = await FlutterIconPicker.showIconPicker(context);
                              if (icon != null) {
                                activity.icon = icon;
                              }
                              planningViewModel.updateActivity(
                                  groupId, activity.id, UpdateActivityRequest(icon: icon?.codePoint.toString()));
                            },
                          ),
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.color.title"),
                            child: CircleAvatar(
                              backgroundColor: activity.color,
                              radius: 24,
                            ),
                            onTap: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: BlockPicker(
                                      pickerColor: activity.color,
                                      availableColors: const [
                                        ActivityColors.blue,
                                        ActivityColors.purple,
                                        ActivityColors.pink,
                                        ActivityColors.red,
                                      ],
                                      onColorChanged: (color) {
                                        activity.color = color;
                                        planningViewModel.updateActivity(
                                          groupId,
                                          activity.id,
                                          UpdateActivityRequest(
                                              color: '#${color.value.toRadixString(16).substring(2)}'),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: LayoutItem(
                        title: AppLocalizations.of(context).translate("groups.planning.activity.edit.members.title"),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: group.members
                                      ?.map(
                                        (e) => LayoutRowItemMember(
                                          name: "${e.firstname} ${e.lastname}",
                                          avatarUrl: MinioService.getImageUrl(e.profilePicture),
                                          isSelected: activity.members.where((member) => member.id == e.id).isNotEmpty,
                                          onTap: (value) {
                                            if (value) {
                                              activity.members.add(ChatMember(
                                                  id: e.id!,
                                                  name: "${e.firstname} ${e.lastname}",
                                                  avatar: NetworkImage(e.profilePicture!)));
                                            } else {
                                              activity.members.removeWhere((member) => member.id == e.id);
                                            }
                                            planningViewModel.toggleActivityMember(groupId, activity.id, e.id!, value);
                                          },
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: LayoutItem(
                        child: LayoutItemValue(
                          value: AppLocalizations.of(context).translate("groups.planning.activity.edit.delete.title"),
                          icon: Icons.close,
                          customColor: Theme.of(context).colorScheme.error,
                          onPressed: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialogChoice(
                                  title: AppLocalizations.of(context)
                                      .translate('groups.planning.activity.edit.delete.content'),
                                  cancelChoice: AppLocalizations.of(context).translate('common.decline'),
                                  confirmChoice: AppLocalizations.of(context).translate('common.accept'),
                                  onConfirm: (value) async {
                                    if (value) {
                                      await planningViewModel.deleteActivity(groupId, activity.id);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
