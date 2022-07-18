import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/constants/navbar/navbar.enum.dart';
import 'package:trip_n_joy_front/models/exceptions/http_exceptions.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/screens/errors/error.screen.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog_password.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_header.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_item_value.widget.dart';

import '../../providers/auth/auth.provider.dart';
import '../../providers/user/user.provider.dart';
import '../../widgets/common/dialog/input_dialog.widget.dart';
import '../../widgets/common/dialog/input_dialog_email.widget.dart';

class SettingsPage extends StatefulHookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final userViewModel = ref.watch(userProvider.notifier);
    final authViewModel = ref.watch(authProvider);
    var user = ref.watch(userProvider).value;

    final minioService = ref.watch(minioProvider);

    if (user == null) {
      return const ErrorScreen();
    }

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        LayoutHeader(
          title: "${user.firstname} ${user.lastname}",
          imageURL: MinioService.getImageUrl(user.profilePicture, DEFAULT_URL.AVATAR),
          onClick: () async {
            final imageURL = await minioService.uploadImage();

            if (imageURL != null) {
              userViewModel.updateUser(authViewModel.token!, UserUpdateRequest(profilePicture: imageURL));
            }
          },
          background: false,
        ),
        LayoutBox(title: AppLocalizations.of(context).translate("settings.about"), children: <Widget>[
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.firstname"),
              child: LayoutItemValue(
                value: user.firstname!,
                onPressed: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: AppLocalizations.of(context).translate("settings.firstname"),
                            label: AppLocalizations.of(context).translate("user.firstname"),
                            initialValue: user.firstname!,
                            onConfirm: (value) async {
                              userViewModel.updateUser(authViewModel.token!, UserUpdateRequest(firstname: value));
                            });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.lastname"),
              child: LayoutItemValue(
                value: user.lastname!,
                onPressed: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: AppLocalizations.of(context).translate("settings.lastname"),
                            label: AppLocalizations.of(context).translate("user.lastname"),
                            initialValue: user.lastname!,
                            onConfirm: (value) async {
                              userViewModel.updateUser(authViewModel.token!, UserUpdateRequest(lastname: value));
                            });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.email"),
              child: LayoutItemValue(
                value: user.email!,
                onPressed: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialogEmail(onConfirm: (newEmail, password) async {
                          await userViewModel.updateEmail(
                              user.id!.toInt(), UpdateEmailRequest(newEmail: newEmail, password: password));
                        });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.password"),
              child: LayoutItemValue(
                value: "•••••••••",
                onPressed: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialogPassword(onConfirm: (password, newPassword) async {
                          authViewModel
                              .updatePassword(UpdatePasswordRequest(oldPassword: password, newPassword: newPassword));
                        });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.phoneNumber"),
              child: LayoutItemValue(
                value: user.phoneNumber ?? AppLocalizations.of(context).translate("settings.noPhoneNumber"),
                onPressed: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: AppLocalizations.of(context).translate("settings.phoneNumber"),
                            label: AppLocalizations.of(context).translate("user.phoneNumber"),
                            initialValue: user.phoneNumber ?? "",
                            onConfirm: (value) async {
                              userViewModel.updateUser(authViewModel.token!, UserUpdateRequest(phoneNumber: value));
                            });
                      });
                },
              )),
          LayoutItem(
              title: AppLocalizations.of(context).translate("user.city"),
              child: LayoutItemValue(
                value: user.city?.name ?? AppLocalizations.of(context).translate("settings.noCity"),
                icon: Icons.keyboard_arrow_right_sharp,
                onPressed: () {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return InputDialog(
                            title: AppLocalizations.of(context).translate("settings.city"),
                            label: AppLocalizations.of(context).translate("user.city"),
                            initialValue: user.city?.name ?? "",
                            onConfirm: (value) async {
                              userViewModel.updateUser(
                                  authViewModel.token!, UserUpdateRequest(city: CityModel(name: value)));
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
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary, fontSize: 20, fontWeight: FontWeight.bold)),
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
        LayoutBox(
          title: AppLocalizations.of(context).translate("common.account"),
          children: <Widget>[
            LayoutItem(
                child: LayoutItemValue(
              value: AppLocalizations.of(context).translate("common.logout"),
              icon: Icons.exit_to_app,
              onPressed: () {
                authViewModel.logout();
                ref.read(navbarStateProvider.notifier).navigate(NavbarPage.MATCHMAKING);
              },
            )),
            LayoutItem(
                cardVariant: true,
                child: LayoutItemValue(
                  value: AppLocalizations.of(context).translate("settings.deleteAccount"),
                  icon: Icons.close,
                  customColor: Theme.of(context).colorScheme.error,
                  onPressed: () async {
                    showBarModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return InputDialog(
                              title: AppLocalizations.of(context).translate("settings.confirmDeleteAccount"),
                              label: AppLocalizations.of(context).translate("user.password"),
                              isPassword: true,
                              initialValue: '',
                              onConfirm: (value) async {
                                final success = await userViewModel.deleteUser(
                                    authViewModel.token!, DeleteUserRequest(password: value));
                                if (success) {
                                  authViewModel.logout();
                                } else {
                                  throw HttpException(
                                      message: AppLocalizations.of(context).translate("errors.wrongPassword"));
                                }
                              });
                        });
                  },
                )),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
      ],
    );
  }
}
