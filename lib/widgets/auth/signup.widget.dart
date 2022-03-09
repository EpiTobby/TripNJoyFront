import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/auth/auth_step.provider.dart';
import 'package:trip_n_joy_front/widgets/common/dropdown.widget.dart';

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
    final gender = useState('MEN');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 29),
            child: Text('TripNJoy',
                style: TextStyle(fontSize: 39, fontWeight: FontWeight.bold))),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Dropdown(
                  label: "Genre",
                  selectedValue: gender.value,
                  listValue: ["MEN", "WOMAN", "OTHER"],
                  listLabel: ["Homme", "Femme", "Autre"],
                  onChanged: (value) => gender.value = value),
              InputField(
                  label: "Prénom",
                  hint: "Votre prénom",
                  onChanged: (value) => firstname.value = value,
                  icon: const Icon(Icons.person)),
              InputField(
                  label: "Nom",
                  hint: "Votre nom",
                  onChanged: (value) => lastname.value = value,
                  icon: const Icon(Icons.person)),
              InputField(
                  label: "Email",
                  hint: "Votre adresse email",
                  onChanged: (value) => email.value = value,
                  icon: const Icon(Icons.email)),
              InputField(
                  label: "Mot de passe",
                  hint: "Votre mot de passe",
                  onChanged: (value) => password.value = value,
                  icon: const Icon(Icons.lock),
                  isPassword: true),
              InputField(
                  label: "Numéro de téléphone (optionnel)",
                  hint: "Votre numéro de téléphone",
                  onChanged: (value) => phoneNumber.value = value,
                  icon: const Icon(Icons.phone)),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Column(
              children: [
                PrimaryButton(
                    text: 'Créer son compte',
                    onPressed: () =>
                        authService.login(email.value, password.value)),
                SecondaryButton(
                    text: 'Retour', onPressed: () => stepProvider.login()),
              ],
            )),
      ],
    );
  }
}
