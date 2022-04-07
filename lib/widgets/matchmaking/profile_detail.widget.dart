import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

import '../common/input_dialog.widget.dart';

class ProfileDetail extends ConsumerWidget {
  const ProfileDetail({Key? key, required this.profileModel}) : super(key: key);

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final matchmakingService = ref.watch(matchmakingProvider.notifier);

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
                            matchmakingService.updateProfile(1);
                          });
                    });
              },
            ),
          )
        ]),
        LayoutBox(title: AppLocalizations.of(context).translate('profile.answers'), children: [
          LayoutItem(
              title: 'Activités',
              child: LayoutItemValue(value: 'Sport, Musée', icon: const Icon(Icons.keyboard_arrow_right_sharp), onPressed: () {})),
          LayoutItem(
              title: 'Chaud ou Froid',
              child: LayoutItemValue(value: 'Chaud', icon: const Icon(Icons.keyboard_arrow_right_sharp), onPressed: () {})),
        ]),
      ]),
    );
  }
}
