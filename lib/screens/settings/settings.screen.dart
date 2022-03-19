import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/settings/settings.provider.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

import '../../providers/auth/auth.provider.dart';
import '../../providers/user/user.provider.dart';
import '../../widgets/common/input_dialog.widget.dart';

class SettingsPage extends StatefulHookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    var settingsService = ref.watch(settingsProvider);
    final authService = ref.watch(authProvider);
    var user = ref.watch(userProvider).value as UserModel;

    return ListView(
      children: <Widget>[
        LayoutHeader(
          title: "${user.firstname} ${user.lastname}",
          imageURL: user.profilePicture ??
              "https://cdn.discordapp.com/avatars/297465470133731329/a9c6e37f6959a30d98038743c799a21f.webp?size=240",
        ),
        LayoutBox(
            title: AppLocalizations.of(context).translate("settings.about"),
            children: <Widget>[
              LayoutItem(
                  title:
                      AppLocalizations.of(context).translate("user.firstname"),
                  child: LayoutItemValue(
                    value: user.firstname!,
                    icon: const Icon(Icons.keyboard_arrow_right_sharp),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("settings.firstname"),
                                label: AppLocalizations.of(context)
                                    .translate("user.firstname"),
                                initialValue: user.firstname!,
                                onConfirm: (value) async {
                                  await settingsService.updateFirstname(
                                      "id", value);
                                });
                          });
                    },
                  )),
              LayoutItem(
                  title:
                      AppLocalizations.of(context).translate("user.lastname"),
                  child: LayoutItemValue(
                    value: user.lastname!,
                    icon: const Icon(Icons.keyboard_arrow_right_sharp),
                    onPressed: () {},
                  )),
              LayoutItem(
                  title: AppLocalizations.of(context).translate("user.email"),
                  child: LayoutItemValue(
                    value: user.email!,
                  )),
              LayoutItem(
                  title:
                      AppLocalizations.of(context).translate("user.password"),
                  child: LayoutItemValue(
                    value: "•••••••••",
                    icon: const Icon(Icons.keyboard_arrow_right_sharp),
                    onPressed: () {},
                  )),
              LayoutItem(
                  title: AppLocalizations.of(context)
                      .translate("user.phoneNumber"),
                  child: LayoutItemValue(
                    value: user.phoneNumber ??
                        AppLocalizations.of(context)
                            .translate("settings.noPhoneNumber"),
                    icon: const Icon(Icons.keyboard_arrow_right_sharp),
                    onPressed: () {},
                  )),
            ]),
        LayoutBox(
          title: AppLocalizations.of(context).translate("settings.theme"),
          children: <Widget>[
            LayoutItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    AppLocalizations.of(context).translate("settings.darkMode"),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24)),
                Switch(
                  value: _darkMode,
                  onChanged: (bool value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                ),
              ],
            ))
          ],
        ),
        LayoutBox(
            title: AppLocalizations.of(context).translate("common.account"),
            children: <Widget>[
              LayoutItem(
                  child: LayoutItemValue(
                value: AppLocalizations.of(context).translate("common.logout"),
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  authService.logout();
                },
              )),
              LayoutItem(
                  child: LayoutItemValue(
                value: AppLocalizations.of(context)
                    .translate("settings.deleteAccount"),
                icon: const Icon(Icons.close),
                customColor: Theme.of(context).colorScheme.error,
                onPressed: () async {
                  ref
                      .read(userProvider.notifier)
                      .deleteUser(authService.token!);
                  authService.logout();
                },
              )),
            ])
      ],
    );
  }
}
