import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/user/user.gender.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/widgets/common/date_picker.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dropdown.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input.widget.dart';

import '../../models/auth/signup.model.dart';
import '../../providers/auth/auth.provider.dart';
import '../../widgets/common/button.widget.dart';

class GoogleMoreInfo extends StatefulHookConsumerWidget {
  const GoogleMoreInfo({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GoogleMoreInfo();
}

class _GoogleMoreInfo extends ConsumerState<GoogleMoreInfo> {
  @override
  Widget build(BuildContext context) {
    final userService = ref.watch(userProvider.notifier);
    final authService = ref.watch(authProvider);
    final birthDate = useState(DateTime.now());
    final gender = useState(Gender.male.name);
    final country = useState('');
    final city = useState('');

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(AppLocalizations.of(context).translate('auth.google.moreInfo'),
                textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        ListView(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          children: [
            Dropdown(
                label: AppLocalizations.of(context).translate("common.gender"),
                icon: const Icon(Icons.person),
                selectedValue: gender.value,
                listValue: [Gender.male.name, Gender.female.name, Gender.other.name],
                listLabel: [
                  AppLocalizations.of(context).translate("user.gender.man"),
                  AppLocalizations.of(context).translate("user.gender.woman"),
                  AppLocalizations.of(context).translate("user.gender.other")
                ],
                onChanged: (value) => gender.value = value),
            DatePicker(
                label: AppLocalizations.of(context).translate("user.birthDate"),
                selectedDate: birthDate.value,
                onChanged: (value) => birthDate.value = value),
            InputField(
                label: AppLocalizations.of(context).translate("user.city"),
                hint: AppLocalizations.of(context).translate("auth.city"),
                onChanged: (value) => city.value = value,
                icon: const Icon(Icons.apartment)),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                PrimaryButton(
                    text: AppLocalizations.of(context).translate("common.submit"),
                    onPressed: () => userService
                        .updateUser(
                            authService.token!,
                            UserUpdateRequest(
                                gender: gender.value, birthdate: birthDate.value, city: CityModel(name: city.value)))
                        .then((value) => Navigator.pop(context))),
              ],
            )),
      ],
    ));
  }
}
