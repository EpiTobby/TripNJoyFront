import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final gender = useState('MEN');

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
                  label: "Genre",
                  icon: Icon(Icons.person),
                  selectedValue: gender.value,
                  listValue: ["MEN", "WOMAN", "OTHER"],
                  listLabel: ["Homme", "Femme", "Autre"],
                  onChanged: (value) => gender.value = value),
              InputField(
                  label: "Prénom",
                  hint: "Votre prénom",
                  onChanged: (value) => firstname.value = value,
                  isError: authService.signupState.isError,
                  icon: const Icon(Icons.person)),
              InputField(
                  label: "Nom",
                  hint: "Votre nom",
                  onChanged: (value) => lastname.value = value,
                  isError: authService.signupState.isError,
                  icon: const Icon(Icons.person)),
              DatePicker(
                  label: "Date de naissance",
                  selectedDate: birthDate.value,
                  onChanged: (value) => birthDate.value = value),
              InputField(
                  label: "Email",
                  hint: "Votre adresse email",
                  onChanged: (value) => email.value = value,
                  isError: authService.signupState.isError,
                  icon: const Icon(Icons.email)),
              InputField(
                  label: "Mot de passe",
                  hint: "Votre mot de passe",
                  onChanged: (value) => password.value = value,
                  icon: const Icon(Icons.lock),
                  isError: authService.signupState.isError,
                  isPassword: true),
              InputField(
                  label: "Numéro de téléphone (optionnel)",
                  hint: "Votre numéro de téléphone",
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
                    text: 'Créer son compte',
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
                    text: 'Retour', onPressed: () => stepProvider.login()),
              ],
            )),
      ],
    );
  }
}