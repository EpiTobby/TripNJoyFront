import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';

import '../../common/button.widget.dart';
import '../../common/card.widget.dart';

class ProfileCreation extends ConsumerWidget {
  const ProfileCreation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    return StandardCard(
      title: "Création du profil voyage",
      subtitle: "Cliquer pour démarrer la création du profil voyage",
      color: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      child: Center(
        child: PrimaryButton(text: "Démarrer", onPressed: () => matchmakingService.startProfileCreation()),
      ),
    );
  }
}
