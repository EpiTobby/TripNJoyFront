import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import 'package:trip_n_joy_front/widgets/common/input_dialog_datetime.widget.dart';
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
  final Activity? activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planningViewModel = ref.watch(planningProvider);
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final draft = activity == null;

    final name = useState('Name');
    final description = useState('Description');
    final startDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());
    final location = useState('Location');
    final color = useState(ActivityColors.blue);
    final icon = useState(Icons.airplane_ticket);

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
            onPressed: () async {
              if (draft) {
                await planningViewModel.addActivity(
                    groupId,
                    CreateActivityRequest(
                      name: name.value,
                      description: description.value,
                      startDate: startDate.value,
                      endDate: endDate.value,
                      location: location.value,
                      color: '#${color.value.value.toRadixString(16).substring(2)}',
                      icon: icon.value.codePoint.toString(),
                    ));
              }
              Navigator.of(context).popUntil(ModalRoute.withName("/planning"));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          PlanningActivity(
            prefix: Icon(
              !draft ? activity!.icon : icon.value,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: !draft ? (activity!.name ?? '') : name.value,
            subtitle: !draft ? (activity!.location ?? '') : location.value,
            subsubtitle: !draft
                ? (activity!.getActivityDateFormat())
                : Activity.getStaticActivityDateFormat(startDate.value, endDate.value),
            description: !draft ? (activity!.description ?? '') : description.value,
            color: !draft ? (activity!.color) : color.value,
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
                        value: !draft ? (activity!.name ?? '') : name.value,
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                                initialValue: !draft ? (activity!.name ?? '') : name.value,
                                onConfirm: (value) async {
                                  if (draft) {
                                    name.value = value;
                                    return;
                                  }

                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity!.id, UpdateActivityRequest(name: value));
                                  if (newActivity != null) {
                                    activity!.name = newActivity.name;
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
                        value: !draft ? (activity!.location ?? '') : location.value,
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.title"),
                                initialValue: !draft ? (activity!.location ?? '') : location.value,
                                onConfirm: (value) async {
                                  if (draft) {
                                    location.value = value;
                                    return;
                                  }

                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity!.id, UpdateActivityRequest(location: value));
                                  if (newActivity != null) {
                                    activity!.location = newActivity.location;
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
                        value: DateFormat("HH:mm - dd/MM/yyyy").format(!draft ? activity!.startDate : startDate.value),
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialogDateTime(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.edit"),
                                initialValue: !draft ? activity!.startDate : startDate.value,
                                onConfirm: (value) async {
                                  if (draft) {
                                    startDate.value = value;
                                    return;
                                  }

                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity!.id, UpdateActivityRequest(startDate: value));
                                  if (newActivity != null) {
                                    activity!.startDate = newActivity.startDate;
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
                        value: DateFormat("HH:mm - dd/MM/yyyy").format(!draft ? activity!.endDate : endDate.value),
                        onPressed: () {
                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialogDateTime(
                                title: AppLocalizations.of(context).translate("groups.planning.activity.edit.end.edit"),
                                initialValue: !draft ? activity!.endDate : endDate.value,
                                onConfirm: (value) async {
                                  if (draft) {
                                    endDate.value = value;
                                    return;
                                  }

                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity!.id, UpdateActivityRequest(endDate: value));
                                  if (newActivity != null) {
                                    activity!.endDate = newActivity.endDate;
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
                        value: !draft ? (activity!.description ?? '') : description.value,
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
                                initialValue: !draft ? (activity!.description ?? '') : description.value,
                                multiline: true,
                                onConfirm: (value) async {
                                  if (draft) {
                                    description.value = value;
                                    return;
                                  }

                                  final newActivity = await planningViewModel.updateActivity(
                                      groupId, activity!.id, UpdateActivityRequest(description: value));
                                  if (newActivity != null) {
                                    activity!.description = newActivity.description;
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
                              !draft ? activity!.icon : icon.value,
                              size: 48,
                            ),
                            onTap: () async {
                              IconData? selectedIcon = await FlutterIconPicker.showIconPicker(context);
                              if (selectedIcon != null) {
                                if (draft) {
                                  icon.value = selectedIcon;
                                  return;
                                }
                                activity!.icon = selectedIcon;
                              }
                              planningViewModel.updateActivity(groupId, activity!.id,
                                  UpdateActivityRequest(icon: selectedIcon?.codePoint.toString()));
                            },
                          ),
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.color.title"),
                            child: CircleAvatar(
                              backgroundColor: !draft ? activity!.color : color.value,
                              radius: 24,
                            ),
                            onTap: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: BlockPicker(
                                      pickerColor: !draft ? activity!.color : color.value,
                                      availableColors: ActivityColors.getColors(),
                                      onColorChanged: (selectedColor) {
                                        if (draft) {
                                          color.value = selectedColor;
                                          return;
                                        }

                                        activity!.color = selectedColor;
                                        planningViewModel.updateActivity(
                                          groupId,
                                          activity!.id,
                                          UpdateActivityRequest(
                                              color: '#${selectedColor.value.toRadixString(16).substring(2)}'),
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
                    if (!draft)
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
                                            isSelected:
                                                activity!.members.where((member) => member.id == e.id).isNotEmpty,
                                            onTap: (value) {
                                              if (value) {
                                                activity!.members.add(ChatMember(
                                                    id: e.id!,
                                                    name: "${e.firstname} ${e.lastname}",
                                                    avatar: NetworkImage(e.profilePicture!)));
                                              } else {
                                                activity!.members.removeWhere((member) => member.id == e.id);
                                              }
                                              planningViewModel.toggleActivityMember(
                                                  groupId, activity!.id, e.id!, value);
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
                    if (!draft)
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
                                        await planningViewModel.deleteActivity(groupId, activity!.id);
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
