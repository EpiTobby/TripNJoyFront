import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
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
            onPressed: () {},
          )),
        ])
      ],
    );
  }
}
