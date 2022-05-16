import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/constants/matchmaking/matchmaking_status.enum.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/swipe.provider.dart';
import 'package:trip_n_joy_front/screens/matchmaking/profile.screen.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/group_not_found_card.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation_card.widget.dart';

import '../../widgets/matchmaking/cards/group_found_card.widget.dart';

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
    final cards = ref.watch(matchmakingProvider).cards;
    final currIndex = ref.watch(matchmakingProvider).index;
    final matchmakingStatus = ref.watch(matchmakingProvider).status;
    final matchmakingViewModel = ref.watch(matchmakingProvider.notifier);
    final swipeViewModel = ref.watch(swipeProvider.notifier);
    if (swipeViewModel.screenSize == Size.zero) {
      swipeViewModel.setScreenSize(MediaQuery.of(context).size);
    }

    final animationController = useAnimationController(duration: const Duration(milliseconds: 150), vsync: this);
    final animation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    final moveAnim = Tween(begin: const Offset(0.0, 0.015), end: const Offset(0.0, 0.05)).animate(animation);
    final scaleAnim = Tween(begin: 0.965, end: 1.0).animate(animation);

    return Scaffold(
      appBar: AppBar(
        leading: matchmakingStatus == MatchmakingStatus.CREATE_PROFILE &&
                cards.isNotEmpty &&
                cards.first.runtimeType != ProfileCreationCard
            ? IconButton(
                onPressed: () => {matchmakingViewModel.previousCard()}, icon: const Icon(Icons.arrow_back_rounded))
            : null,
        title: Text(AppLocalizations.of(context).translate("matchmaking.title"),
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileSettings()));
            },
          ),
        ],
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: Container(
        child: matchmakingStatus != MatchmakingStatus.CREATE_PROFILE
            ? matchmakingStatus != MatchmakingStatus.NO_GROUP
                ? GroupFoundCard(
                    groupId: 1,
                    isLoading: matchmakingStatus == MatchmakingStatus.WAITING_MATCHMAKING,
                    groupPhotoUrl: DEFAULT_AVATAR_URL,
                    membersPhotoUrls: const [],
                  )
                : const GroupNotFoundCard()
            : cards.isEmpty || currIndex >= cards.length || currIndex < 0
                ? const ProfileCreationCard()
                : Stack(
                    alignment: Alignment.topCenter,
                    children: cards.reversed.map((card) {
                      final index = cards.indexOf(card) - currIndex;
                      if (index >= 0 && index <= 2) {
                        return FractionalTranslation(
                            translation: getCardTranslation(index, moveAnim),
                            child: Transform.scale(
                                scale: getCardScale(index, scaleAnim), child: card.build(context, index == 0, false)));
                      }
                      return Container();
                    }).toList()),
      ),
    );
  }

  Offset getCardTranslation(
    int index,
    Animation<Offset> moveAnim,
  ) {
    if (index == 1) {
      return moveAnim.value;
    } else if (index == 2) {
      return const Offset(0.0, -0.02);
    }
    return const Offset(0.0, 0.05);
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
