import 'package:flutter/material.dart';

import 'package:trip_n_joy_front/app_localizations.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          AppLocalizations.of(context).translate('groups.title')
      ),
    );
  }
}
