import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

class ProfileCreationCard extends ConsumerWidget {
  const ProfileCreationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchmakingViewModel = ref.watch(matchmakingProvider.notifier);
    return StandardCard(
      title: AppLocalizations.of(context).translate('cards.creation_profile.title'),
      subtitle: AppLocalizations.of(context).translate('cards.creation_profile.subtitle'),
      color: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      child: Center(
        child: PrimaryButton(
            text: AppLocalizations.of(context).translate('common.start'),
            onPressed: () => matchmakingViewModel.startProfileCreation()),
      ),
    );
  }
}
