import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/swipe.provider.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation_card.widget.dart';

class MatchmakingPage extends StatefulHookConsumerWidget {
  const MatchmakingPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MatchmakingPageState();
}

class _MatchmakingPageState extends ConsumerState<MatchmakingPage> {
  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(matchmakingProvider);
    final swipeService = ref.watch(swipeProvider.notifier);
    if (swipeService.screenSize == Size.zero) {
      swipeService.setScreenSize(MediaQuery.of(context).size);
    }
    return Container(
      child: cards.isEmpty
          ? const ProfileCreationCard()
          : Stack(
              alignment: Alignment.topCenter,
              children: cards.reversed.map((card) {
                final index = cards.indexOf(card);
                if (index == 0) {
                  return Positioned(
                      width: MediaQuery.of(context).size.width, top: 20, child: card.build(context, true));
                } else if (index == 1) {
                  return Positioned(
                      width: MediaQuery.of(context).size.width - 10, top: 10, child: card.build(context, false));
                } else if (index == 2) {
                  return Positioned(
                      width: MediaQuery.of(context).size.width - 25, top: 0, child: card.build(context, false));
                }
                return Container();
              }).toList()),
    );
  }
}
