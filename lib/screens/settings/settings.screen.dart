import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/settings/settings.provider.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

import '../../models/user/user.model.dart';
import '../../providers/user/user.provider.dart';
import '../../services/log/logger.service.dart';
import '../../widgets/common/button.widget.dart';
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
    var user = ref.watch(userProvider).value as User;
    return ListView(
      children: <Widget>[
        LayoutHeader(
          title: "${user.firstname} ${user.lastname}",
          imageURL: user.profilePicture ??
              "https://cdn.discordapp.com/avatars/297465470133731329/a9c6e37f6959a30d98038743c799a21f.webp?size=240",
        ),
        LayoutBox(title: "Information personnelles", children: <Widget>[
          LayoutItem(
              title: 'Prénom',
              child: LayoutItemValue(
                value: user.firstname!,
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: "Changer de prénom",
                            label: "Prénom",
                            initialValue: user.firstname!,
                            onConfirm: (value) async {
                              await settingsService.updateFirstname(
                                  "id", value);
                            });
                      });
                },
              )),
          LayoutItem(
              title: 'Nom',
              child: LayoutItemValue(
                value: user.lastname!,
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {},
              )),
          LayoutItem(
              title: 'Email',
              child: LayoutItemValue(
                value: user.email!,
              )),
          LayoutItem(
              title: 'Mot de passe',
              child: LayoutItemValue(
                value: "•••••••••",
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {},
              )),
          LayoutItem(
              title: 'Numéro de téléphone',
              child: LayoutItemValue(
                value: user.phoneNumber ?? "Aucun numéro",
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {},
              )),
        ]),
        LayoutBox(
          title: "Thème",
          children: <Widget>[
            LayoutItem(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mode Sombre",
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
        LayoutBox(title: "Compte", children: <Widget>[
          LayoutItem(
              child: LayoutItemValue(
            value: "Se déconnecter",
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {},
          )),
          LayoutItem(
              child: LayoutItemValue(
            value: "Supprimer mon compte",
            icon: const Icon(Icons.close),
            customColor: Theme.of(context).colorScheme.error,
            onPressed: () {},
          )),
        ])
      ],
    );
  }
}
