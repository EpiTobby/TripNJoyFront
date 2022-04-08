import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

import '../../common/button.widget.dart';

class RangeCard extends StatefulHookConsumerWidget {
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
  ConsumerState<RangeCard> createState() => _RangeCardState();
}

class _RangeCardState extends ConsumerState<RangeCard> {
  @override
  Widget build(BuildContext context) {
    double start = widget.min;
    double end = widget.max;
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    return StandardCard(
      name: widget.name,
      title: widget.title,
      subtitle: widget.subtitle,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
      shadowColor: widget.shadowColor,
      isLoading: widget.isLoading,
      child: Column(
        children: [
          Expanded(
            child: RangeSlider(
              values: RangeValues(start, end),
              onChanged: (RangeValues value) {
                setState(() {
                  start = value.start;
                  end = value.end;
                });
              },
              min: widget.min,
              max: widget.max,
              activeColor: Theme.of(context).sliderTheme.activeTrackColor,
              labels: RangeLabels(start.round().toString(), end.round().toString()),
              divisions: (widget.max - widget.min).toInt(),
            ),
          ),
          PrimaryButton(
            text: AppLocalizations.of(context).translate('common.validate'),
            onPressed: () {
              matchmakingService.submitRangeValue(widget.name, RangeValues(start, end));
            },
          ),
        ],
      ),
    );
  }
}
