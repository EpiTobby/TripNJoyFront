import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/extensions/AsyncValue.extension.dart';

import '../../providers/auth/auth.provider.dart';
import '../../widgets/common/button.widget.dart';
import '../../widgets/common/input.widget.dart';

class AccountVerification extends HookConsumerWidget {
  const AccountVerification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authProvider);
    final code = useState('');
    final resendCountdown = useState(0);

    useEffect(() {
      final timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (resendCountdown.value > 0) {
          resendCountdown.value--;
        }
      });
      return timer.cancel;
    }, [resendCountdown]);

    ref.listen<AsyncValue<void>>(authVerifyAccountStateProvider,
        (_, state) => state.showSnackBarOnError(context));

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)
                    .translate('auth.verification.title'),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)
                    .translate('auth.verification.description'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
              InputField(
                label: AppLocalizations.of(context)
                    .translate('auth.verification.code'),
                hint: AppLocalizations.of(context)
                    .translate('auth.verification.label'),
                icon: const Icon(Icons.lock),
                isError: authService.verifyAccountState.isError,
                onChanged: (value) {
                  code.value = value;
                },
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: AppLocalizations.of(context)
                    .translate('auth.verification.submit'),
                onPressed: () {
                  authService.verifyAccount(code.value).then((value) =>
                      {if (value != null) Navigator.of(context).pop()});
                },
                isLoading: authService.verifyAccountState.isLoading,
                isDisabled: code.value.isEmpty,
              ),
              SecondaryButton(
                  text: resendCountdown.value == 0
                      ? AppLocalizations.of(context)
                          .translate('auth.verification.sendBack')
                      : AppLocalizations.of(context).translate(
                          'auth.verification.resendCountdown',
                          {'time': resendCountdown.value.toString()}),
                  onPressed: () {
                    resendCountdown.value = 30;
                  },
                  isDisabled: resendCountdown.value != 0)
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
