import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';

import '../../common/button.widget.dart';

class NameProfileCard extends HookConsumerWidget {
  const NameProfileCard({Key? key, this.isLoading = false}) : super(key: key);

  final bool isLoading;
  final name = "name_profile";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animation = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final offset = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -2))
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
    final profileName = useState("");
    final matchmakingService = ref.watch(matchmakingProvider.notifier);
    return SlideTransition(
      position: offset,
      child: StandardCard(
        name: "NameProfileCard",
        title: AppLocalizations.of(context).translate("cards.name_profile.title"),
        subtitle: AppLocalizations.of(context).translate("cards.name_profile.subtitle"),
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        isLoading: isLoading,
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
                animation.forward();
                Future.delayed(const Duration(milliseconds: 500), () {
                  matchmakingService.submitCard(name, profileName.value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
