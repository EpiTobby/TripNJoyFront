import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

class PlanningHeader extends StatelessWidget {
  const PlanningHeader({
    Key? key,
    required this.group,
  }) : super(key: key);

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
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
              title: AppLocalizations.of(context).translate("groups.planning.destination.title"),
              child: LayoutItemValue(
                value: "planning.destination",
                onPressed: () {
                  showMaterialModalBottomSheet(
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
                  showMaterialModalBottomSheet(
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
                multiline: true,
                fontSize: 16,
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialog(
                        title: AppLocalizations.of(context).translate("groups.planning.note.edit"),
                        label: AppLocalizations.of(context).translate("groups.planning.note.title"),
                        initialValue: "planning.note",
                        multiline: true,
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
    );
  }
}
