import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/settings/settings.provider.dart';
import 'package:trip_n_joy_front/screens/errors/error.screen.dart';
import 'package:trip_n_joy_front/services/auth/auth.service.dart';
import 'package:trip_n_joy_front/services/user/user.service.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_password.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';

import '../../providers/auth/auth.provider.dart';
import '../../providers/user/user.provider.dart';
import '../../widgets/common/input_dialog.widget.dart';

import 'package:image_picker/image_picker.dart';

import 'package:minio/io.dart';
import 'package:minio/minio.dart';

import '../../widgets/common/input_dialog_email.widget.dart';

const DEFAULT_AVATAR_URL = "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png";
const MINIO_ENDPOINT = "127.0.0.1";
const MINIO_ACCESS_KEY = "minioadmin";
const MINIO_SECRET_KEY = "minioadmin";
const MINIO_PORT = 9000;
const MINIO_BUCKET = "tripnjoy";

class SettingsPage extends StatefulHookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _darkMode = false;

  void upload(UserService userService, AuthService authService) async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile == null) {
      return;
    }

    var imageBytes = pickedFile.readAsBytes().asStream();

    final minio = Minio(
        endPoint: MINIO_ENDPOINT,
        accessKey: MINIO_ACCESS_KEY,
        secretKey: MINIO_SECRET_KEY,
        useSSL: false,
        port: MINIO_PORT);

    await minio.putObject(MINIO_BUCKET, pickedFile.name, imageBytes);

    var imageURL = await minio.presignedGetObject(MINIO_BUCKET, pickedFile.name);

    userService.updateUser(authService.token!, UserUpdateRequest(profilePicture: imageURL));
  }

  @override
  Widget build(BuildContext context) {
    var settingsService = ref.watch(settingsProvider);
    final userService = ref.watch(userProvider.notifier);
    final authService = ref.watch(authProvider);
    var user = ref
        .watch(userProvider)
        .value;

    if (user == null) {
      return ErrorScreen(authService: authService);
    }

    return ListView(
      children: <Widget>[
        LayoutHeader(
          title: "${user.firstname} ${user.lastname}",
          imageURL: user.profilePicture ?? DEFAULT_AVATAR_URL,
          onClick: () => upload(userService, authService),
        ),
        LayoutBox(title: AppLocalizations.of(context).translate("settings.about"), children: <Widget>[
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.firstname"),
              child: LayoutItemValue(
                value: user.firstname!,
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: AppLocalizations.of(context).translate("settings.firstname"),
                            label: AppLocalizations.of(context).translate("user.firstname"),
                            initialValue: user.firstname!,
                            onConfirm: (value) async {
                              userService.updateUser(authService.token!, UserUpdateRequest(firstname: value));
                            });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.lastname"),
              child: LayoutItemValue(
                value: user.lastname!,
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: AppLocalizations.of(context).translate("settings.lastname"),
                            label: AppLocalizations.of(context).translate("user.lastname"),
                            initialValue: user.lastname!,
                            onConfirm: (value) async {
                              userService.updateUser(authService.token!, UserUpdateRequest(lastname: value));
                            });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.email"),
              child: LayoutItemValue(
                value: user.email!,
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialogEmail(onConfirm: (newEmail, password) async {
                          await userService.updateEmail(
                              user.id!.toInt(), UpdateEmailRequest(newEmail: newEmail, password: password));
                        });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.password"),
              child: LayoutItemValue(
                value: "•••••••••",
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialogPassword(onConfirm: (password, newPassword) async {
                          authService
                              .updatePassword(UpdatePasswordRequest(oldPassword: password, newPassword: newPassword));
                        });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.phoneNumber"),
              child: LayoutItemValue(
                value: user.phoneNumber ?? AppLocalizations.of(context).translate("settings.noPhoneNumber"),
                icon: const Icon(Icons.keyboard_arrow_right_sharp),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: AppLocalizations.of(context).translate("settings.phoneNumber"),
                            label: AppLocalizations.of(context).translate("user.phoneNumber"),
                            initialValue: user.phoneNumber ?? "",
                            onConfirm: (value) async {
                              userService.updateUser(authService.token!, UserUpdateRequest(phoneNumber: value));
                            });
                      });
                },
              )),
        ]),
        LayoutBox(
          title: AppLocalizations.of(context).translate("settings.theme"),
          children: <Widget>[
            LayoutItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context).translate("settings.darkMode"),
                        style: TextStyle(color: Theme
                            .of(context)
                            .colorScheme
                            .primary, fontSize: 24)),
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
        LayoutBox(title: AppLocalizations.of(context).translate("common.account"), children: <Widget>[
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
                value: AppLocalizations.of(context).translate("settings.deleteAccount"),
                icon: const Icon(Icons.close),
                customColor: Theme
                    .of(context)
                    .colorScheme
                    .error,
                onPressed: () async {
                  ref.read(userProvider.notifier).deleteUser(authService.token!);
                  authService.logout();
                },
              )),
        ])
      ],
    );
  }
}
