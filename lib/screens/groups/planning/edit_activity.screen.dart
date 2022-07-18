import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/extensions/HexColor.extension.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog_choice.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog_datetime.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/planning_activity.widget.dart';

import '../../../constants/common/colors.style.dart';

class EditActivity extends HookConsumerWidget {
  const EditActivity({
    Key? key,
    required this.groupId,
    this.activity,
    this.suggestedActivity,
  }) : super(key: key);

  final int groupId;
  final Activity? activity;
  final CreateActivityRequest? suggestedActivity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planningViewModel = ref.watch(planningProvider);
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final draft = activity == null;

    final name = useState(activity?.name ?? suggestedActivity?.name ?? 'Name');
    final description = useState(activity?.description ?? suggestedActivity?.description ?? 'Description');
    final startDate = useState(activity?.startDate ?? suggestedActivity?.startDate ?? DateTime.now());
    final endDate = useState(activity?.endDate ?? suggestedActivity?.endDate ?? DateTime.now());
    final location = useState(activity?.location ?? suggestedActivity?.location ?? 'Location');
    final color = useState(activity?.color ??
        (suggestedActivity?.color != null ? HexColor.fromHex(suggestedActivity!.color!) : ActivityColors.blue));
    final icon = useState(activity?.icon ??
        (suggestedActivity?.icon != null
            ? IconData(int.parse(suggestedActivity!.icon!), fontFamily: 'MaterialIcons')
            : Icons.airplane_ticket));
    final participants = useState(activity?.members ?? []);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.activity.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        actions: [
          if (group.state != GroupModelState.archived)
            IconButton(
              splashRadius: 16,
              icon: const Icon(Icons.check),
              onPressed: () async {
                Map<String, dynamic> json = {
                  'name': name.value,
                  'description': description.value,
                  'startDate': startDate.value.toIso8601String(),
                  'endDate': endDate.value.toIso8601String(),
                  'location': location.value,
                  'color': '#${color.value.value.toRadixString(16).substring(2)}',
                  'icon': icon.value.codePoint.toString(),
                  'participants': participants.value.map((member) => member.id).toList(),
                };

                if (draft) {
                  await planningViewModel.addActivity(groupId, CreateActivityRequest.fromJson(json));
                } else {
                  await planningViewModel.updateActivity(groupId, activity!.id, UpdateActivityRequest.fromJson(json));
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
              icon.value,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: name.value,
            subtitle: location.value,
            subsubtitle: Activity.getStaticActivityDateFormat(startDate.value, endDate.value),
            description: description.value,
            color: color.value,
          ),
          Expanded(
            child: ListView(
              children: [
                LayoutBox(
                  top: true,
                  title: AppLocalizations.of(context).translate("groups.planning.activity.edit.title"),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.icon.title"),
                            child: Icon(
                              icon.value,
                              size: 48,
                            ),
                            onTap: group.state != GroupModelState.archived
                                ? () async {
                                    IconData? selectedIcon = await FlutterIconPicker.showIconPicker(context);
                                    if (selectedIcon != null) {
                                      icon.value = selectedIcon;
                                    }
                                  }
                                : () {},
                          ),
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.color.title"),
                            child: CircleAvatar(
                              backgroundColor: color.value,
                              radius: 24,
                            ),
                            onTap: group.state != GroupModelState.archived
                                ? () {
                                    showBarModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                                          child: BlockPicker(
                                            pickerColor: color.value,
                                            availableColors: ActivityColors.getColors(),
                                            onColorChanged: (selectedColor) {
                                              color.value = selectedColor;
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  }
                                : () {},
                          ),
                        ],
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                      child: LayoutItemValue(
                        editable: group.state != GroupModelState.archived,
                        value: name.value,
                        onPressed: () {
                          showBarModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                                initialValue: name.value,
                                onConfirm: (value) async {
                                  name.value = value;
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
                        editable: group.state != GroupModelState.archived,
                        value: location.value,
                        onPressed: () {
                          showBarModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.title"),
                                initialValue: location.value,
                                onConfirm: (value) async {
                                  location.value = value;
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
                        editable: group.state != GroupModelState.archived,
                        value: DateFormat("HH:mm - dd/MM/yyyy").format(startDate.value),
                        onPressed: () {
                          showBarModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialogDateTime(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.edit"),
                                initialValue: startDate.value,
                                onConfirm: (value) async {
                                  startDate.value = value;
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
                        editable: group.state != GroupModelState.archived,
                        value: DateFormat("HH:mm - dd/MM/yyyy").format(endDate.value),
                        onPressed: () {
                          showBarModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialogDateTime(
                                title: AppLocalizations.of(context).translate("groups.planning.activity.edit.end.edit"),
                                initialValue: endDate.value,
                                onConfirm: (value) async {
                                  endDate.value = value;
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
                        editable: group.state != GroupModelState.archived,
                        value: description.value,
                        multiline: true,
                        fontSize: 20,
                        onPressed: () {
                          showBarModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.title"),
                                initialValue: description.value,
                                multiline: true,
                                onConfirm: (value) async {
                                  description.value = value;
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    if (!draft)
                      LayoutItem(
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
                                          avatarUrl: MinioService.getImageUrl(e.profilePicture, DEFAULT_URL.AVATAR),
                                          isSelected:
                                              participants.value.where((member) => member.id == e.id).isNotEmpty,
                                          onTap: group.state != GroupModelState.archived
                                              ? (value) {
                                                  if (value) {
                                                    participants.value = [
                                                      ...participants.value,
                                                      ChatMember(
                                                          id: e.id!,
                                                          name: "${e.firstname} ${e.lastname}",
                                                          avatar: NetworkImage(MinioService.getImageUrl(
                                                              e.profilePicture, DEFAULT_URL.AVATAR)))
                                                    ];
                                                  } else {
                                                    participants.value = participants.value
                                                        .where((member) => member.id != e.id)
                                                        .toList();
                                                  }
                                                }
                                              : (value) {},
                                        ),
                                      )
                                      .toList() ??
                                  [],
                            ),
                          ),
                        ),
                      ),
                    if (!draft && group.state != GroupModelState.archived)
                      LayoutItem(
                        card: true,
                        cardVariant: true,
                        child: LayoutItemValue(
                          value: AppLocalizations.of(context).translate("groups.planning.activity.edit.delete.title"),
                          icon: Icons.close,
                          customColor: Theme.of(context).colorScheme.error,
                          onPressed: () {
                            showBarModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialogChoice(
                                  title: AppLocalizations.of(context)
                                      .translate('groups.planning.activity.edit.delete.content'),
                                  cancelChoice: AppLocalizations.of(context).translate('common.decline'),
                                  confirmChoice: AppLocalizations.of(context).translate('common.delete'),
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
                    const Padding(padding: EdgeInsets.only(top: 16)),
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
