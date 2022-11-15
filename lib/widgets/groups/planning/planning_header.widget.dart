import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog_date.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item_value.widget.dart';

class PlanningHeader extends ConsumerWidget {
  const PlanningHeader({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 20, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutItem(
              card: false,
              title: AppLocalizations.of(context).translate("groups.planning.destination.title"),
              child: LayoutItemValue(
                editable: group.state != GroupInfoModelState.archived,
                value: group.destination ?? AppLocalizations.of(context).translate("groups.planning.destination.empty"),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialog(
                        title: AppLocalizations.of(context).translate("groups.planning.destination.edit"),
                        label: AppLocalizations.of(context).translate("groups.planning.destination.title"),
                        initialValue: group.destination ?? '',
                        onConfirm: (value) async {
                          if (group.owner == null) {
                            await groupViewModel.updatePublicGroup(
                                group.id!.toInt(), UpdatePublicGroupRequest(destination: value));
                          } else {
                            await groupViewModel.updatePrivateGroup(
                                group.id!.toInt(), UpdatePrivateGroupRequest(destination: value));
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
            LayoutItem(
              card: false,
              title: AppLocalizations.of(context).translate("groups.planning.date.title"),
              child: LayoutItemValue(
                editable: group.state != GroupInfoModelState.archived,
                value: group.startOfTrip == null || group.endOfTrip == null
                    ? AppLocalizations.of(context).translate("groups.planning.date.empty")
                    : "${DateFormat("dd/MM/yyyy").format(group.startOfTrip!)} - ${DateFormat("dd/MM/yyyy").format(group.endOfTrip!)}",
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialogDate(
                        title: AppLocalizations.of(context).translate("groups.planning.date.edit"),
                        initialStartDate: group.startOfTrip ?? DateTime.now(),
                        initialEndDate: group.endOfTrip ?? DateTime.now(),
                        onConfirm: (startDate, endDate) async {
                          groupViewModel.updatePrivateGroup(
                              group.id!.toInt(), UpdatePrivateGroupRequest(startOfTrip: startDate, endOfTrip: endDate));
                        },
                      );
                    },
                  );
                },
              ),
            ),
            LayoutItem(
              card: false,
              title: AppLocalizations.of(context).translate("groups.planning.note.title"),
              child: LayoutItemValue(
                editable: group.state != GroupInfoModelState.archived,
                value: group.description ?? AppLocalizations.of(context).translate("groups.planning.note.empty"),
                multiline: true,
                fontSize: 16,
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialog(
                        title: AppLocalizations.of(context).translate("groups.planning.note.edit"),
                        label: AppLocalizations.of(context).translate("groups.planning.note.title"),
                        initialValue: group.description ?? '',
                        multiline: true,
                        onConfirm: (value) async {
                          groupViewModel.updatePrivateGroup(
                              group.id!.toInt(), UpdatePrivateGroupRequest(description: value));
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
