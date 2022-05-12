import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

class GroupPlanning extends HookConsumerWidget {
  const GroupPlanning({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
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
                    title: AppLocalizations.of(context).translate("groups.planning.destination.title"),
                    child: LayoutItemValue(
                      value: "planning.destination",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return InputDialog(
                              title: AppLocalizations.of(context).translate("groups.planning.destination.edit"),
                              label: AppLocalizations.of(context).translate("groups.planning.destination.title"),
                              initialValue: "planning.destination",
                              onConfirm: (value) async {},
                            );
                          },
                        );
                      },
                    ),
                  ),
                  LayoutItem(
                    title: AppLocalizations.of(context).translate("groups.planning.date.title"),
                    child: LayoutItemValue(
                      value: "planning.date",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // TODO: create edit date dialog
                            return InputDialog(
                              title: AppLocalizations.of(context).translate("groups.planning.date.edit"),
                              label: AppLocalizations.of(context).translate("groups.planning.date.title"),
                              initialValue: "planning.date",
                              onConfirm: (value) async {},
                            );
                          },
                        );
                      },
                    ),
                  ),
                  LayoutItem(
                    title: AppLocalizations.of(context).translate("groups.planning.note.title"),
                    child: LayoutItemValue(
                      value: "planning.note",
                      fontSize: 16,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return InputDialog(
                              title: AppLocalizations.of(context).translate("groups.planning.note.edit"),
                              label: AppLocalizations.of(context).translate("groups.planning.note.title"),
                              initialValue: "planning.note",
                              onConfirm: (value) async {},
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
