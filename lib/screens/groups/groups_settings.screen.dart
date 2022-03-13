import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_member.widget.dart';

class GroupsSettings extends StatefulWidget {
  const GroupsSettings({Key? key}) : super(key: key);

  @override
  _GroupsSettingsState createState() => _GroupsSettingsState();
}

class _GroupsSettingsState extends State<GroupsSettings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LayoutHeader(
            imageURL:
                "https://cdn.discordapp.com/avatars/297465470133731329/a9c6e37f6959a30d98038743c799a21f.webp?size=240"),
        LayoutBox(title: "Information sur le groupe", children: [
          LayoutItem(
            title: "Nom du groupe",
            child: LayoutItemValue(
              value: "Direction Marseille!",
              icon: const Icon(Icons.keyboard_arrow_right_sharp),
              onPressed: () {},
            ),
          ),
          LayoutItem(
            title: "Description",
            child: LayoutItemValue(
              value:
                  "Ce groupe est destiné à ...", // TODO : handle overflow of the text
              icon: const Icon(Icons.keyboard_arrow_right_sharp),
              onPressed: () {},
            ),
          ),
          LayoutItem(
              title: "Membres",
              child: Column(
                children: [
                  LayoutMember(
                    imageURL:
                        "https://cdn.discordapp.com/avatars/297465470133731329/a9c6e37f6959a30d98038743c799a21f.webp?size=240",
                    name: 'Tony Heng',
                  ),
                  LayoutMember(
                      imageURL:
                          "https://cdn.discordapp.com/avatars/297465470133731329/a9c6e37f6959a30d98038743c799a21f.webp?size=240",
                      name: "Yanis Chaabane"),
                ],
              )),
        ]),
        LayoutBox(title: "Paramètres du groupe", children: [
          LayoutItem(
              child: LayoutItemValue(
            value: "Fermer le groupe",
            icon: const Icon(Icons.lock_outline),
            onPressed: () {},
          )),
          LayoutItem(
              child: LayoutItemValue(
            value: "Archiver le groupe",
            icon: const Icon(Icons.archive_outlined),
            onPressed: () {},
          )),
          LayoutItem(
              child: LayoutItemValue(
            value: "Quitter le groupe",
            icon: const Icon(Icons.exit_to_app),
            customColor: Theme.of(context).colorScheme.error,
            onPressed: () {},
          )),
        ])
      ],
    );
  }
}