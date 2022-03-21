import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/user/user.gender.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/providers/auth/auth_step.provider.dart';
import 'package:trip_n_joy_front/widgets/common/date_picker.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dropdown.widget.dart';

import '../../models/auth/signup.model.dart';
import '../../providers/auth/auth.provider.dart';
import '../common/button.widget.dart';
import '../common/input.widget.dart';

class SignUp extends StatefulHookConsumerWidget {
  const SignUp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    final stepProvider = ref.watch(authStepProvider.notifier);
    final authService = ref.watch(authProvider);
    final firstname = useState('');
    final lastname = useState('');
    final email = useState('');
    final password = useState('');
    final phoneNumber = useState('');
    final birthDate = useState(DateTime.now());
    final gender = useState(Gender.male.name);

    ref.listen<AsyncValue<void>>(authSignupStateProvider,
        (_, state) => state.showSnackBarOnError(context));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text('TripNJoy',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Dropdown(
                  label:
                      AppLocalizations.of(context).translate("common.gender"),
                  icon: Icon(Icons.person),
                  selectedValue: gender.value,
                  listValue: [
                    Gender.male.name,
                    Gender.female.name,
                    Gender.other.name
                  ],
                  listLabel: [
                    AppLocalizations.of(context).translate("user.gender.man"),
                    AppLocalizations.of(context).translate("user.gender.woman"),
                    AppLocalizations.of(context).translate("user.gender.other")
                  ],
                  onChanged: (value) => gender.value = value),
              InputField(
                  label:
                      AppLocalizations.of(context).translate("user.firstname"),
                  hint:
                      AppLocalizations.of(context).translate("auth.firstname"),
                  onChanged: (value) => firstname.value = value,
                  isError: authService.signupState.isError,
                  icon: const Icon(Icons.person)),
              InputField(
                  label:
                      AppLocalizations.of(context).translate("user.lastname"),
                  hint: AppLocalizations.of(context).translate("auth.lastname"),
                  onChanged: (value) => lastname.value = value,
                  isError: authService.signupState.isError,
                  icon: const Icon(Icons.person)),
              DatePicker(
                  label:
                      AppLocalizations.of(context).translate("user.birthDate"),
                  selectedDate: birthDate.value,
                  onChanged: (value) => birthDate.value = value),
              InputField(
                  label: AppLocalizations.of(context).translate("user.email"),
                  hint: AppLocalizations.of(context).translate("auth.email"),
                  onChanged: (value) => email.value = value,
                  isError: authService.signupState.isError,
                  icon: const Icon(Icons.email)),
              InputField(
                  label:
                      AppLocalizations.of(context).translate("user.password"),
                  hint: AppLocalizations.of(context).translate("auth.password"),
                  onChanged: (value) => password.value = value,
                  icon: const Icon(Icons.lock),
                  isError: authService.signupState.isError,
                  isPassword: true),
              InputField(
                  label: AppLocalizations.of(context)
                      .translate("user.phoneNumber"),
                  hint: AppLocalizations.of(context)
                      .translate("auth.phoneNumber"),
                  onChanged: (value) => phoneNumber.value = value,
                  isError: authService.signupState.isError,
                  icon: const Icon(Icons.phone)),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                PrimaryButton(
                    text: AppLocalizations.of(context)
                        .translate("auth.createAccount"),
                    onPressed: () => authService.signup(SignupCredentials(
                        gender: gender.value,
                        firstname: firstname.value,
                        lastname: lastname.value,
                        birthDate: birthDate.value.toString(),
                        email: email.value,
                        password: password.value,
                        phoneNumber: phoneNumber.value.isEmpty
                            ? null
                            : phoneNumber.value))),
                SecondaryButton(
                    text: AppLocalizations.of(context).translate("common.back"),
                    onPressed: () => stepProvider.login()),
              ],
            )),
      ],
    );
  }
}
