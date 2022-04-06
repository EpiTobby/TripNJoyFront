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

    var activeProfile = profileModels.where((profile) => profile.active == true).first;

    return ListView(children: [
      LayoutBox(title: AppLocalizations.of(context).translate('profile.active'), children: [
        LayoutItem(
          child: ProfileMenu(
            profileModel: activeProfile,
            value: activeProfile.name!,
          ),
        )
      ]),
      LayoutBox(title: AppLocalizations.of(context).translate('profile.other'), children: [
        ...profileModels.where((profile) => profile.active == false).map(
              (profile) => LayoutItem(
                  child:
                      LayoutItemValue(value: profile.name!, icon: const Icon(Icons.more_horiz), onPressed: () {})),
            ),
      ]),
    ]);
  }
}
