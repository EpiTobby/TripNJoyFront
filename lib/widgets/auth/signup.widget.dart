import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/user/user.gender.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/widgets/common/date_picker.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dropdown.widget.dart';

import '../../models/auth/signup.model.dart';
import '../../providers/auth/auth.provider.dart';
import '../../providers/auth/auth_step.provider.dart';
import '../common/button.widget.dart';
import '../common/input.widget.dart';

class SignUp extends StatefulHookConsumerWidget {
  const SignUp({Key? key, required this.parentContext}) : super(key: key);

  final BuildContext parentContext;

  @override
  ConsumerState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    final stepProvider = ref.watch(authStepProvider.notifier);
    final authViewModel = ref.watch(authProvider);
    final firstname = useState('');
    final lastname = useState('');
    final email = useState('');
    final password = useState('');
    final phoneNumber = useState('');
    final birthDate = useState(DateTime.now());
    final gender = useState(Gender.male.name);
    final city = useState('');

    ref.listen<AsyncValue<void>>(
        authSignupStateProvider, (_, state) => state.showSnackBarOnError(widget.parentContext));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () => authViewModel.goToLogin(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
                  Text(
                    AppLocalizations.of(context).translate("common.back"),
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'TripNJoy',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
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
                  isError: authViewModel.signupState.isError,
                  onChanged: (value) => gender.value = value),
              InputField(
                  label: AppLocalizations.of(context).translate("user.firstname"),
                  hint: AppLocalizations.of(context).translate("auth.firstname"),
                  onChanged: (value) => firstname.value = value,
                  isError: authViewModel.signupState.isError,
                  icon: const Icon(Icons.person)),
              InputField(
                  label: AppLocalizations.of(context).translate("user.lastname"),
                  hint: AppLocalizations.of(context).translate("auth.lastname"),
                  onChanged: (value) => lastname.value = value,
                  isError: authViewModel.signupState.isError,
                  icon: const Icon(Icons.person)),
              DatePicker(
                  label: AppLocalizations.of(context).translate("user.birthDate"),
                  selectedDate: birthDate.value,
                  isError: authViewModel.signupState.isError,
                  onChanged: (value) => birthDate.value = value),
              InputField(
                  label: AppLocalizations.of(context).translate("user.email"),
                  hint: AppLocalizations.of(context).translate("auth.email"),
                  onChanged: (value) => email.value = value,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  isError: authViewModel.signupState.isError,
                  icon: const Icon(Icons.email)),
              InputField(
                  label: AppLocalizations.of(context).translate("user.password"),
                  hint: AppLocalizations.of(context).translate("auth.password"),
                  onChanged: (value) => password.value = value,
                  icon: const Icon(Icons.lock),
                  isError: authViewModel.signupState.isError,
                  isPassword: true),
              InputField(
                  label: AppLocalizations.of(context).translate("user.phoneNumber"),
                  hint: AppLocalizations.of(context).translate("auth.phoneNumber"),
                  onChanged: (value) => phoneNumber.value = value,
                  isError: authViewModel.signupState.isError,
                  icon: const Icon(Icons.phone)),
              InputField(
                  label: AppLocalizations.of(context).translate("user.city"),
                  hint: AppLocalizations.of(context).translate("auth.city"),
                  onChanged: (value) => city.value = value,
                  isError: authViewModel.signupState.isError,
                  icon: const Icon(Icons.apartment)),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                PrimaryButton(
                    text: AppLocalizations.of(context).translate("common.signup"),
                    isLoading: authViewModel.signupState.isLoading,
                    onPressed: () => authViewModel.signup(SignupCredentials(
                        gender: gender.value,
                        firstname: firstname.value,
                        lastname: lastname.value,
                        birthDate: birthDate.value.toString(),
                        email: email.value,
                        password: password.value,
                        phoneNumber: phoneNumber.value.isEmpty ? null : phoneNumber.value,
                        language: AppLocalizations.of(context).locale.languageCode == "en" ? "ENGLISH" : "FRENCH",
                        city: city.value))),
                SecondaryButton(
                    text: AppLocalizations.of(context).translate("common.back"),
                    onPressed: () => authViewModel.goToLogin()),
              ],
            )),
      ],
    );
  }
}
