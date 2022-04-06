import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/swipe.provider.dart';
import 'package:trip_n_joy_front/services/matchmaking/swipe.service.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

import '../../../constants/matchmaking/swipe.icons.dart';

class SwipeCard extends ConsumerWidget {
  const SwipeCard(
      {Key? key,
      required this.name,
      this.title,
      this.subtitle,
      required this.color,
      required this.backgroundColor,
      this.shadowColor,
      this.onTop = false,
      this.isLoading = false,
      required this.values})
      : super(key: key);

  final String name;
  final String? title;
  final String? subtitle;
  final Color color;
  final Color backgroundColor;
  final Color? shadowColor;
  final bool onTop;
  final bool isLoading;
  final List<String> values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return onTop ? buildFrontCard(context, ref) : buildCard(context);
  }

  Widget buildFrontCard(BuildContext context, WidgetRef ref) {
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
            child: buildCard(context),
          );
        }), onPanStart: (details) {
          final provider = ref.watch(swipeProvider);
          provider.startPosition(details);
        }, onPanUpdate: (details) {
          final provider = ref.watch(swipeProvider);
          provider.updatePosition(details);
        }, onPanEnd: (details) {
          final provider = ref.watch(swipeProvider);
          provider.endPosition(details, name, values);
        }),
        SwipeButtons(name: name, values: values),
      ],
    );
  }

  Widget buildCard(BuildContext context) {
    return StandardCard(
      name: name,
      title: title,
      subtitle: subtitle,
      color: color,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      isLoading: isLoading,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                      child: Text(
                        values[0],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      SwipeCardIcon.left_arrow,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 36,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      SwipeCardIcon.right_arrow,
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 36,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                      child: Text(
                        values[1],
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                values[2],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              SwipeCardIcon.down_arrow,
              color: Theme.of(context).colorScheme.primaryContainer,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeButtons extends ConsumerWidget {
  const SwipeButtons({
    Key? key,
    required this.name,
    required this.values,
  }) : super(key: key);

  final String name;
  final List<String> values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(swipeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SwipeButton(
            icon: Icons.arrow_circle_left_outlined,
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () => provider.swipeLeft(name, values[0])),
        SwipeButton(
            icon: Icons.arrow_circle_down_outlined,
            color: Theme.of(context).colorScheme.primaryContainer,
            onPressed: () => provider.swipeDown(name, values[1])),
        SwipeButton(
            icon: Icons.arrow_circle_right_outlined,
            color: Theme.of(context).colorScheme.tertiary,
            onPressed: () => provider.swipeRight(name, values[2])),
      ],
    );
  }
}

class SwipeButton extends StatelessWidget {
  const SwipeButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);
  final IconData? icon;
  final Color color;
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
      child: IconButton(iconSize: 40, icon: Icon(icon, color: color), onPressed: onPressed),
    );
  }
}