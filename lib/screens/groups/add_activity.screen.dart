import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/screens/groups/edit_activity.screen.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

class AddActivity extends HookConsumerWidget {
  const AddActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.activity.add')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 16),
            child: LayoutItem(
              child: LayoutItemValue(
                value: AppLocalizations.of(context).translate("groups.planning.activity.manual"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditActivity()));
                },
              ),
            ),
          ),
          LayoutBox(
            title: AppLocalizations.of(context).translate("groups.planning.activity.suggestion"),
            children: <Widget>[
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.sport"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.tourism"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.restaurant"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.bar"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.shopping"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.beach"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.park"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.club"),
                  onPressed: () {},
                ),
              ),
              LayoutItem(
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("groups.planning.activity.type.other"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
