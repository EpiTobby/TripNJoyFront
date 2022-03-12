import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(AppLocalizations.of(context).translate("settings.title")),
    );
  }
}
