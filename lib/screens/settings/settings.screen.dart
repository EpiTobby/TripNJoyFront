import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        LayoutHeader(title: "Yanis Chaabane",imageURL: "https://cdn.discordapp.com/avatars/297465470133731329/a9c6e37f6959a30d98038743c799a21f.webp?size=240",),
        LayoutBox(title: "Information personnelles", children: <Widget>[
          LayoutItem(
              title: 'Prénom',
              child: LayoutItemValue(
                value: "Tony",
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {},
              )),
          LayoutItem(
              title: 'Nom',
              child: LayoutItemValue(
                value: "Heng",
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {},
              )),
          LayoutItem(
              title: 'Email',
              child: LayoutItemValue(
                value: "tony.heng@epita.fr",
              )),
          LayoutItem(
              title: 'Mot de passe',
              child: LayoutItemValue(
                value: "********",
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
                Text("Mode Sombre",  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 24)),
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
