import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

import '../../common/button.widget.dart';
import '../../common/checkbox.widget.dart';

class MultipleChoiceCard extends HookConsumerWidget {
  const MultipleChoiceCard(
      {Key? key,
      required this.name,
      this.title,
      this.subtitle,
      required this.color,
      required this.backgroundColor,
      this.shadowColor,
      required this.values})
      : super(key: key);

  final String name;
  final String? title;
  final String? subtitle;
  final Color color;
  final Color backgroundColor;
  final Color? shadowColor;
  final List<String> values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValues = useState<List<String>>([]);
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    return StandardCard(
      name: name,
      title: title,
      subtitle: subtitle,
      color: color,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              children: <Widget>[
                for (final value in values)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: StandardCheckbox(
                      value: value,
                      onTap: () {
                        if (selectedValues.value.contains(value)) {
                          selectedValues.value = selectedValues.value.where((element) => element != value).toList();
                        } else {
                          selectedValues.value = [...selectedValues.value, value];
                        }
                      },
                      checked: selectedValues.value.contains(value),
                    ),
                  ),
              ],
            ),
          ),
          PrimaryButton(
            text: AppLocalizations.of(context).translate('common.validate'),
            onPressed: () {
              matchmakingService.submitMultipleChoiceCard(name, selectedValues.value);
            },
          ),
        ],
      ),
    );
  }
}
