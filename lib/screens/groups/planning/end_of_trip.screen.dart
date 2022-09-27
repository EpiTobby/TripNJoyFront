import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';

class EndOfTrip extends HookConsumerWidget {
  const EndOfTrip({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                AppLocalizations.of(context).translate("groups.settings.end.title"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0, left: 50.0, right: 50.0),
              child: Text(
                AppLocalizations.of(context).translate("groups.settings.end.subtitle"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24,
                ),
              ),
            ),
            PrimaryButton(
              text: AppLocalizations.of(context).translate("groups.settings.archive"),
              onPressed: () async {
                await ref.read(groupProvider).updatePrivateGroup(
                    groupId, UpdatePrivateGroupRequest(state: UpdatePrivateGroupRequestState.archived));
                Navigator.pop(context);
              },
            ),
            SecondaryButton(
              text: AppLocalizations.of(context).translate("common.back"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
