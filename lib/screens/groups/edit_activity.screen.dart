import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_choice.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_activity.widget.dart';

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
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          PlanningActivity(
            prefix: Icon(
              Icons.airplane_ticket,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: activity.name ?? '',
            subtitle: activity.location ?? '',
            subsubtitle:
                "${DateFormat("H:m dd/MM/yyyy").format(activity.startDate)} - ${DateFormat("H:m dd/MM/yyyy").format(activity.endDate)}",
            description: activity.description ?? '',
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                                initialValue: activity.name ?? '',
                                onConfirm: (value) async {
                                  await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(name: value));
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.title"),
                                initialValue: activity.location ?? '',
                                onConfirm: (value) async {
                                  await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(location: value));
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
                        value: DateFormat("H:m - dd/MM/yyyy").format(activity.startDate),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.title"),
                                initialValue: "",
                                onConfirm: (value) async {
                                  await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(startDate: value));
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
                        value: DateFormat("H:m - dd/MM/yyyy").format(activity.endDate),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context).translate("groups.planning.activity.edit.end.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.end.title"),
                                initialValue: "",
                                onConfirm: (value) async {
                                  await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(endDate: value));
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.title"),
                                initialValue: activity.description ?? '',
                                onConfirm: (value) async {
                                  await planningViewModel.updateActivity(
                                      groupId, activity.id, UpdateActivityRequest(description: value));
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
                            onTap: () {},
                          ),
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.color.title"),
                            child: CircleAvatar(
                              backgroundColor: activity.color,
                              radius: 24,
                            ),
                            onTap: () {},
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
                                            isSelected:
                                                activity.members.where((member) => member.id == e.id).isNotEmpty,
                                            onSelected: (value) {}),
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialogChoice(
                                  title: AppLocalizations.of(context)
                                      .translate('groups.planning.activity.edit.delete.content'),
                                  cancelChoice: AppLocalizations.of(context).translate('common.decline'),
                                  confirmChoice: AppLocalizations.of(context).translate('common.accept'),
                                  onConfirm: (value) async {
                                    await planningViewModel.deleteActivity(groupId, activity.id);
                                    Navigator.of(context).pop();
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
