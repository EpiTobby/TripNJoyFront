import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

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
      required this.max,
      required this.onPressed})
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
  final Function onPressed;

  @override
  ConsumerState<RangeCard> createState() => _RangeCardState();
}

class _RangeCardState extends ConsumerState<RangeCard> {
  RangeValues? values;

  @override
  Widget build(BuildContext context) {
    final animation = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final offset = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -2))
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

    if (values == null || values!.start < widget.min || values!.end > widget.max) {
      values = RangeValues(widget.min, widget.max);
    }
    return SlideTransition(
      position: offset,
      child: StandardCard(
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
                values: values!,
                onChanged: (RangeValues value) {
                  setState(() {
                    values = value;
                  });
                },
                min: widget.min,
                max: widget.max,
                activeColor: Theme.of(context).sliderTheme.activeTrackColor,
                labels: RangeLabels(values!.start.round().toString(), values!.end.round().toString()),
                divisions: (widget.max - widget.min).toInt(),
              ),
            ),
            PrimaryButton(
              text: AppLocalizations.of(context).translate('common.validate'),
              onPressed: () {
                widget.onPressed(widget.name, values!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
