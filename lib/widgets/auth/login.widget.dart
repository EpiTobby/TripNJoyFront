import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/screens/auth/forgot_password.screen.dart';
import 'package:trip_n_joy_front/screens/matchmaking/matchmaking.screen.dart';
import 'package:trip_n_joy_front/services/auth/auth.service.dart';

import '../../providers/auth/auth.provider.dart';
import '../../providers/auth/auth_step.provider.dart';
import '../common/button.widget.dart';
import '../common/input.widget.dart';

import 'package:firebase_auth/firebase_auth.dart';

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
    final stepProvider = ref.watch(authStepProvider.notifier);
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
            isPassword: true),
        FutureBuilder(
          future: AuthService.initializeFirebase(context),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error initializing Firebase');
            } else if (snapshot.connectionState == ConnectionState.done) {
              return GoogleSignInButton();
            }
            return const CircularProgressIndicator();
          },
        ),
        Padding(
            padding: const EdgeInsets.only(top: 29),
            child: Column(
              children: [
                PrimaryButton(
                    text: AppLocalizations.of(context).translate("common.login"),
                    isLoading: auth.loginState.isLoading,
                    onPressed: () => auth.login(email.value, password.value)),
                SecondaryButton(
                    text: AppLocalizations.of(context).translate("auth.createAccount"),
                    onPressed: () => stepProvider.signUp()),
                TertiaryButton(
                    text: AppLocalizations.of(context).translate("auth.forgotPassword"),
                    onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()))),
              ],
            )),
      ],
    ));
  }
}

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User? user = await AuthService.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MatchmakingPage(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[

                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
