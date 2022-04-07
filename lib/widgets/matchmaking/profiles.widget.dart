import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/profile_menu.widget.dart';

class ProfilesList extends ConsumerWidget {
  const ProfilesList({Key? key, required this.profileModels}) : super(key: key);

  final List<ProfileModel> profileModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        : ListView(children: [
            activeProfile.isEmpty
                ? const SizedBox()
                : LayoutBox(title: AppLocalizations.of(context).translate('profile.active'), children: [
                    LayoutItem(
                      child: ProfileMenu(
                        parentContext: context,
                        profileModel: activeProfile.first,
                        value: activeProfile.first.name!,
                      ),
                    )
                  ]),
            LayoutBox(title: AppLocalizations.of(context).translate('profile.other'), children: [
              ...inactiveProfiles.map(
                (profile) => LayoutItem(child: ProfileMenu(parentContext: context,profileModel: profile, value: profile.name!)),
              )
            ]),
          ]);
  }
}
