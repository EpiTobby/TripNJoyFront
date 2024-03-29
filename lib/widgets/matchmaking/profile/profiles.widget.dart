import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_empty.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/profile/profile_menu.widget.dart';

class ProfilesList extends ConsumerWidget {
  const ProfilesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileModels = ref.watch(profileProvider)!;

    var activeProfile = profileModels.where((profile) => profile.active == true);
    var inactiveProfiles = profileModels.where((profile) => profile.active == false);

    return profileModels.isEmpty
        ? Center(
            child: Text(
            AppLocalizations.of(context).translate('profile.noProfile'),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ))
        : RefreshIndicator(
            onRefresh: () => ref.read(profileProvider.notifier).getUserProfiles(),
            color: Theme.of(context).colorScheme.secondary,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: ListView(
              children: [
                LayoutBox(
                  title: AppLocalizations.of(context).translate('profile.active'),
                  top: true,
                  children: [
                    activeProfile.isEmpty
                        ? LayoutEmpty(
                            message: AppLocalizations.of(context).translate('profile.active_empty'),
                            icon: Icons.highlight_remove,
                          )
                        : LayoutItem(
                            child: ProfileMenu(
                              parentContext: context,
                              profileModel: activeProfile.first,
                              value: activeProfile.first.name!,
                            ),
                          )
                  ],
                ),
                LayoutBox(
                  title: AppLocalizations.of(context).translate('profile.other'),
                  children: [
                    ...inactiveProfiles.map(
                      (profile) => LayoutItem(
                          child: ProfileMenu(parentContext: context, profileModel: profile, value: profile.name!)),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
