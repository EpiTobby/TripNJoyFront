import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/profile_creation.widget.dart';

class MatchmakingPage extends ConsumerStatefulWidget {
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
    return Container(
      child: cards.isEmpty ? const ProfileCreation() : cards.first,
    );
  }
}
