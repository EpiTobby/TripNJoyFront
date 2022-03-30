import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/swipe.provider.dart';
import 'package:trip_n_joy_front/services/matchmaking/swipe.service.dart';
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
    return buildFrontCard(ref);
  }

  Widget buildFrontCard(WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(child: LayoutBuilder(builder: (context, constraints) {
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
            child: buildCard(),
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
        }),
        SwipeButtons(),
      ],
    );
  }

  Widget buildCard() {
    return StandardCard(
        name: name,
        title: title,
        subtitle: subtitle,
        color: color,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        child: Container());
  }
}

class SwipeButtons extends ConsumerWidget {
  const SwipeButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(swipeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SwipeButton(icon: Icons.arrow_circle_left_outlined, onPressed: () => provider.swipeLeft()),
        SwipeButton(icon: Icons.arrow_circle_down_outlined, onPressed: () => provider.swipeDown()),
        SwipeButton(icon: Icons.arrow_circle_right_outlined, onPressed: () => provider.swipeRight()),
      ],
    );
  }
}

class SwipeButton extends StatelessWidget {
  const SwipeButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
            blurRadius: 10,
          ),
        ],
      ),
      child: IconButton(
          iconSize: 40, icon: Icon(icon, color: Theme.of(context).colorScheme.primary), onPressed: onPressed),
    );
  }
}
