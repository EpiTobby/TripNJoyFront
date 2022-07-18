import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';

import '../../providers/auth/auth.provider.dart';
import '../../widgets/common/button.widget.dart';
import '../../widgets/common/input/input.widget.dart';

class ResetPassword extends HookConsumerWidget {
  const ResetPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authProvider);
    final code = useState('');
    final password = useState('');

    ref.listen<AsyncValue<void>>(authResetPasswordStateProvider, (_, state) => state.showSnackBarOnError(context));

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).translate('auth.reset_password.title'),
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context).translate('auth.reset_password.description'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
              InputField(
                label: AppLocalizations.of(context).translate('auth.reset_password.code'),
                hint: AppLocalizations.of(context).translate('auth.reset_password.code_label'),
                icon: const Icon(Icons.app_registration),
                isError: authViewModel.resetPasswordState.isError,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  code.value = value;
                },
              ),
              InputField(
                label: AppLocalizations.of(context).translate('auth.reset_password.password'),
                hint: AppLocalizations.of(context).translate('auth.reset_password.password_label'),
                icon: const Icon(Icons.lock),
                isError: authViewModel.resetPasswordState.isError,
                isPassword: true,
                onChanged: (value) {
                  password.value = value;
                },
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: AppLocalizations.of(context).translate('auth.reset_password.submit'),
                onPressed: () {
                  authViewModel.resetPassword(email, code.value, password.value).then((value) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  });
                },
                isLoading: authViewModel.resetPasswordState.isLoading,
                isDisabled: code.value.isEmpty || password.value.isEmpty,
              ),
              SecondaryButton(
                  text: AppLocalizations.of(context).translate('common.back'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
