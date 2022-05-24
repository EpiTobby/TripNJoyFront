import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';

class PlaceSuggestion extends HookConsumerWidget {
  const PlaceSuggestion({
    Key? key,
    required this.place,
  }) : super(key: key);

  final String place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: ListView(
        children: [
          Text(AppLocalizations.of(context).translate('groups.planning.activity.suggestion.map.title'),
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          // map
          LayoutBox(
            title: AppLocalizations.of(context).translate("groups.planning.activity.suggestion.title"),
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}
