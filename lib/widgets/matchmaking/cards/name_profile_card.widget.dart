import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';

import '../../common/button.widget.dart';
import '../../common/checkbox.widget.dart';

class NameProfileCard extends HookConsumerWidget {
  const NameProfileCard({Key? key}) : super(key: key);

  final name = "name_profile";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileName = useState("");
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    return StandardCard(
      name: "NameProfileCard",
      title: AppLocalizations.of(context).translate("cards.name_profile.title"),
      subtitle: AppLocalizations.of(context).translate("cards.name_profile.title"),
      shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                child: InputField(
                  label: AppLocalizations.of(context).translate("cards.name_profile.label"),
                  onChanged: (value) => profileName.value = value,
                ),
              ),
            ),
          ),
          PrimaryButton(
            text: AppLocalizations.of(context).translate('common.validate'),
            isDisabled: profileName.value.isEmpty,
            onPressed: () {
              matchmakingService.submitCard(name, profileName.value);
            },
          ),
        ],
      ),
    );
  }
}
