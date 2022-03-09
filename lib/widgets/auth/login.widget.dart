import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';

import '../../providers/auth/auth.provider.dart';
import '../../providers/auth/auth_step.provider.dart';
import '../common/button.widget.dart';
import '../common/input.widget.dart';

class Login extends StatefulHookConsumerWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    final stepProvider = ref.watch(authStepProvider.notifier);
    final auth = ref.watch(authProvider);
    final email = useState('');
    final password = useState('');

    ref.listen<AsyncValue<void>>(authLoginStateProvider,
        (_, state) => state.showSnackBarOnError(context));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text('TripNJoy',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold))),
        InputField(
          label: "Email",
          hint: "Votre adresse email",
          onChanged: (value) => email.value = value,
          icon: const Icon(Icons.email),
          isError: auth.loginState.isError,
        ),
        InputField(
            label: "Mot de passe",
            hint: "Votre mot de passe",
            onChanged: (value) => password.value = value,
            icon: const Icon(Icons.lock),
            isError: auth.loginState.isError,
            isPassword: true),
        Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Column(
              children: [
                PrimaryButton(
                    text: 'Se connecter',
                    isLoading: auth.loginState.isLoading,
                    onPressed: () => auth.login(email.value, password.value)),
                SecondaryButton(
                    text: 'Créer un compte',
                    onPressed: () => stepProvider.signUp()),
              ],
            )),
      ],
    );
  }
}
