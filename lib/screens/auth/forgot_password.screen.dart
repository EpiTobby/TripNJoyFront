import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/screens/auth/reset_password.screen.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';

class ForgotPassword extends HookConsumerWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authProvider);
    final email = useState('');

    ref.listen<AsyncValue<void>>(authForgotPasswordStateProvider, (_, state) => state.showSnackBarOnError(context));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).translate('auth.forgot_password.title'),
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context).translate('auth.forgot_password.description'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
              InputField(
                label: AppLocalizations.of(context).translate('auth.forgot_password.email'),
                hint: AppLocalizations.of(context).translate('auth.forgot_password.label'),
                icon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                isError: authViewModel.forgotPasswordState.isError,
                onChanged: (value) {
                  email.value = value;
                },
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: AppLocalizations.of(context).translate('auth.forgot_password.submit'),
                onPressed: () {
                  authViewModel.forgotPassword(email.value).then((value) =>
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPassword(email: email.value))));
                },
                isLoading: authViewModel.forgotPasswordState.isLoading,
                isDisabled: email.value.isEmpty,
              ),
              SecondaryButton(
                  text: AppLocalizations.of(context).translate('common.back'), onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
