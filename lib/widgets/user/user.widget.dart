import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

class UserDialog extends StatelessWidget {
  const UserDialog({Key? key, required this.user}) : super(key: key);

  final MemberModel user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(MinioService.getImageUrl(user.profilePicture, DEFAULT_URL.AVATAR)),
            radius: 30,
          ),
          Text(user.firstname! + ' ' + user.lastname!),
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Email: ' + user.email!),
            Text('Phone: ' + (user.phoneNumber ?? AppLocalizations.of(context).translate('user.noPhoneNumber'))),
            Text('Gender: ' + user.gender.toString().split('.')[1]),
            Text('City: ' +
                (user.city != null ? user.city!.name! : AppLocalizations.of(context).translate('user.noCity')))
          ],
        ),
      ),
    );
  }
}
