import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

class GroupNotFoundCard extends ConsumerWidget {
  const GroupNotFoundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StandardCard(
      title: AppLocalizations.of(context).translate("matchmaking.noGroup.title"),
      subtitle: AppLocalizations.of(context).translate("matchmaking.noGroup.subtitle"),
      color: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: PrimaryButton(
              text: AppLocalizations.of(context).translate('matchmaking.newProfile'),
              onPressed: () {
                ref.read(matchmakingProvider).restartProfileCreation();
              },
            ),
          ),
        ],
      ),
    );
  }
}
