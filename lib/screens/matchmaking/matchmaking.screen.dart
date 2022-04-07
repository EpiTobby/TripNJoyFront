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

class _MatchmakingPageState extends ConsumerState<MatchmakingPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(matchmakingProvider);
    final swipeService = ref.watch(swipeProvider.notifier);
    if (swipeService.screenSize == Size.zero) {
      swipeService.setScreenSize(MediaQuery.of(context).size);
    }

    final animationController = useAnimationController(duration: const Duration(milliseconds: 150), vsync: this);
    final animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    final translationAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(-1000.0, 0.0)).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    final moveAnim = Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, 0.5)).animate(animation);
    final scaleAnim = Tween(begin: 0.965, end: 1.0).animate(animation);
    return Container(
      child: cards.isEmpty
          ? const ProfileCreationCard()
          : Stack(
              alignment: Alignment.topCenter,
              children: cards.reversed.map((card) {
                final index = cards.indexOf(card);
                if (index <= 2) {
                  return Transform.translate(
                    offset: getCardTranslate(index, translationAnim),
                    child: FractionalTranslation(
                        translation: getCardTranslation(index, moveAnim),
                        child: Transform.scale(scale: getCardScale(index, scaleAnim), child: card)),
                  );
                }
                return Container();
              }).toList()),
    );
  }

  Offset getCardTranslation(
    int index,
    Animation<Offset> moveAnim,
  ) {
    if (index == 0) {
      return moveAnim.value;
    } else if (index > 0 && index <= 2) {
      return Offset(0.0, 0.05 * index);
    }
    return const Offset(0.0, 0.0);
  }

  double getCardScale(int index, Animation<double> scaleAnim) {
    if (index == 0) {
      return 1.0;
    } else if (index == 1) {
      return scaleAnim.value;
    }
    return (1 - (0.035 * index.abs()));
  }

  Offset getCardTranslate(int index, Animation<Offset> translationAnim) {
    if (index == 0) {
      return translationAnim.value;
    }
    return Offset(0.0, 0.0);
  }
}
