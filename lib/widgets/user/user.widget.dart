import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';

class UserDialog extends StatelessWidget {
  const UserDialog({Key? key, required this.user}) : super(key: key);

  final MemberModel user;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePicture ?? DEFAULT_AVATAR_URL),
                  radius: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(user.firstname! + ' ' + user.lastname!),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0 ,bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ' + user.email!),
                      Text('Phone: ' + (user.phoneNumber ?? AppLocalizations.of(context).translate('user.noPhoneNumber'))),
                      Text('Gender: ' + user.gender.toString().split('.')[1]),
                      Text('City: ' +
                          (user.city != null ? user.city!.name! : AppLocalizations.of(context).translate('user.noCity'))),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                        text: AppLocalizations.of(context).translate('groups.settings.recommend'),
                        onPressed: () {},
                        fitContent: true),
                    PrimaryButton(
                        text: AppLocalizations.of(context).translate('groups.settings.report'),
                        onPressed: () {},
                        fitContent: true,
                        isError: true),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
