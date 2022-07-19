import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';
import 'package:trip_n_joy_front/widgets/auth/google.widget.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';

class Login extends StatefulHookConsumerWidget {
  const Login({
    Key? key,
    required this.parentContext,
  }) : super(key: key);

  final BuildContext parentContext;

  @override
  ConsumerState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final email = useState('');
    final password = useState('');

    ref.listen<AsyncValue<void>>(authLoginStateProvider, (_, state) => state.showSnackBarOnError(widget.parentContext));

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text('TripNJoy',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary, fontSize: 40, fontWeight: FontWeight.bold))),
          InputField(
            label: AppLocalizations.of(context).translate("user.email"),
            hint: AppLocalizations.of(context).translate("auth.email"),
            onChanged: (value) => email.value = value,
            icon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            isError: auth.loginState.isError,
          ),
          InputField(
            label: AppLocalizations.of(context).translate("user.password"),
            hint: AppLocalizations.of(context).translate("auth.password"),
            onChanged: (value) => password.value = value,
            icon: const Icon(Icons.lock),
            isError: auth.loginState.isError,
            isPassword: true,
            displayForgotPassword: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Column(
              children: [
                PrimaryButton(
                  text: AppLocalizations.of(context).translate("common.login"),
                  isLoading: auth.loginState.isLoading,
                  onPressed: () => auth.login(email.value, password.value),
                ),
                TertiaryButton(
                  text: AppLocalizations.of(context).translate("common.signup"),
                  onPressed: () => auth.goToSignup(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    "- " + AppLocalizations.of(context).translate("common.or").toUpperCase() + " -",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primaryContainer),
                  ),
                ),
                FutureBuilder(
                  future: AuthViewModel.initializeFirebase(context),
                  builder: (context, snapshot) {
                    return const GoogleSignInButton();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
