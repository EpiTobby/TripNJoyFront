import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/profile_detail.widget.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/profiles.widget.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key, required this.profileModels}) : super(key: key);

  final List<ProfileModel> profileModels;

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
          title: Text(AppLocalizations.of(context).translate('profile.title')),
          foregroundColor: Colors.black,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        ),
        body: ProfilesList(profileModels: widget.profileModels,));
  }
}
