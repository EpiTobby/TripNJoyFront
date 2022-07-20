import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/groups/planning.provider.dart';
import 'package:trip_n_joy_front/screens/groups/planning/edit_activity.screen.dart';
import 'package:trip_n_joy_front/screens/groups/planning/place_suggestion.screen.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item_value.widget.dart';

class AddActivity extends HookConsumerWidget {
  const AddActivity({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planningViewModel = ref.watch(planningProvider);
    final places = planningViewModel.places;

    useEffect(() {
      Future.microtask(() => ref.read(planningProvider).getPlaces());
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.activity.add')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 16),
            child: LayoutItem(
              child: LayoutItemValue(
                value: AppLocalizations.of(context).translate("groups.planning.activity.manual"),
                icon: Icons.add,
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditActivity(groupId: groupId)));
                },
              ),
            ),
          ),
          LayoutBox(
            title: AppLocalizations.of(context).translate("groups.planning.activity.suggestion.title"),
            children: <Widget>[
              AsyncValueWidget<List<String>>(
                value: places,
                data: (places) => Column(
                  children: places
                      .map(
                        (place) => LayoutItem(
                          child: LayoutItemValue(
                            value: AppLocalizations.of(context).translate("groups.planning.activity.type.$place"),
                            onPressed: () async {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => PlaceSuggestion(groupId: groupId, place: place)));
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
