import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

import '../../common/button.widget.dart';

class RangeCard extends HookConsumerWidget {
  const RangeCard(
      {Key? key,
      required this.name,
      this.title,
      this.subtitle,
      required this.color,
      required this.backgroundColor,
      this.shadowColor,
      this.isLoading = false,
      required this.min,
      required this.max})
      : super(key: key);

  final String name;
  final String? title;
  final String? subtitle;
  final Color color;
  final Color backgroundColor;
  final Color? shadowColor;
  final bool isLoading;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRange = useState(RangeValues(min, max));
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    return StandardCard(
      name: name,
      title: title,
      subtitle: subtitle,
      color: color,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      isLoading: isLoading,
      child: Column(
        children: [
          Expanded(
            child: RangeSlider(
              values: selectedRange.value,
              onChanged: (RangeValues value) {
                selectedRange.value = value;
              },
              min: min,
              max: max,
              activeColor: Theme.of(context).sliderTheme.activeTrackColor,
              labels:
                  RangeLabels(selectedRange.value.start.round().toString(), selectedRange.value.end.round().toString()),
              divisions: (max - min).toInt(),
            ),
          ),
          PrimaryButton(
            text: AppLocalizations.of(context).translate('common.validate'),
            onPressed: () {
              matchmakingService.submitRangeValue(name, selectedRange.value);
            },
          ),
        ],
      ),
    );
  }
}
