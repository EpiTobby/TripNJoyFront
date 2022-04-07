import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/cards/range_card.widget.dart';

import '../common/input_dialog.widget.dart';

class ProfileDetail extends ConsumerWidget {
  const ProfileDetail({Key? key, required this.profileId}) : super(key: key);

  final int profileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final profileModels = ref.watch(profileProvider);
    final profileModel = profileModels!.firstWhere((profile) => profile.id == profileId);
    final profileService = ref.watch(profileProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(AppLocalizations.of(context).translate('profile.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      body: ListView(children: [
        LayoutBox(title: AppLocalizations.of(context).translate('profile.information'), children: [
          LayoutItem(
            title: AppLocalizations.of(context).translate('profile.name'),
            child: LayoutItemValue(
              value: profileModel.name!,
              icon: const Icon(Icons.keyboard_arrow_right_sharp),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialog(
                          title: AppLocalizations.of(context).translate("profile.name"),
                          label: AppLocalizations.of(context).translate("profile.name"),
                          initialValue: profileModel.name!,
                          onConfirm: (value) async {
                            profileService.updateProfile(
                                profileModel.id!.toInt(),
                                ProfileUpdateRequest.fromJsonFactory({
                                  "name": value,
                                }));
                          });
                    });
              },
            ),
          )
        ]),
        LayoutBox(title: AppLocalizations.of(context).translate('profile.answers'), children: [
          LayoutItem(
              title: 'Nombre de personnes',
              child: LayoutItemValue(
                  value: profileModel.groupeSize!.minValue.toString() +
                      ' - ' +
                      profileModel.groupeSize!.maxValue.toString(),
                  icon: const Icon(Icons.keyboard_arrow_right_sharp),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                            child: RangeCard(
                                name: "groupSize",
                                title: 'How many people are you looking for?',
                                subtitle: "Select the range of people you are looking for",
                                min: 1,
                                max: 15,
                                color: CColors.primary,
                                backgroundColor: CardColors.yellow,
                                onPressed: (name, value) {
                                  profileService.updateProfile(
                                      profileModel.id!.toInt(),
                                      ProfileUpdateRequest.fromJsonFactory({
                                        name: {"minValue": value.start.round().toInt(), "maxValue": value.end.round().toInt()}
                                      }));

                                  Navigator.pop(context);
                                }),
                          );
                        });
                  })),
          LayoutItem(
              title: 'Chaud ou Froid',
              child: LayoutItemValue(
                  value: 'Chaud', icon: const Icon(Icons.keyboard_arrow_right_sharp), onPressed: () {})),
        ]),
      ]),
    );
  }
}
