import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/matchmaking/swipe.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

class SwipeCard extends ConsumerWidget {
  const SwipeCard(
      {Key? key,
      this.name,
      this.title,
      this.subtitle,
      required this.color,
      required this.backgroundColor,
      this.shadowColor,
      required this.values})
      : super(key: key);

  final String? name;
  final String? title;
  final String? subtitle;
  final Color color;
  final Color backgroundColor;
  final Color? shadowColor;
  final List<String> values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(child: LayoutBuilder(builder: (context, constraints) {
      final provider = ref.watch(swipeProvider);
      final position = provider.position;
      final milliseconds = provider.isDragging ? 0 : 400;
      final center = constraints.smallest.center(Offset.zero);
      final angle = provider.angle * pi / 180;
      final rotatedMatrix = Matrix4.identity()
        ..translate(center.dx, center.dy)
        ..rotateZ(angle)
        ..translate(-center.dx, -center.dy);

      return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: milliseconds),
        transform: rotatedMatrix..translate(position.dx, position.dy),
        child: StandardCard(
            name: name,
            title: title,
            subtitle: subtitle,
            color: color,
            backgroundColor: backgroundColor,
            shadowColor: shadowColor,
            child: Container()),
      );
    }), onPanStart: (details) {
      final provider = ref.watch(swipeProvider);
      provider.startPosition(details);
    }, onPanUpdate: (details) {
      final provider = ref.watch(swipeProvider);
      provider.updatePosition(details);
    }, onPanEnd: (details) {
      final provider = ref.watch(swipeProvider);
      provider.endPosition(details);
    });
  }
}
