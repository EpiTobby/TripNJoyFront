import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

import '../../widgets/common/button.widget.dart';
import '../../widgets/common/input.widget.dart';

class AccountVerification extends HookConsumerWidget {
  const AccountVerification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: AppLocalizations.of(context)
                    .translate('auth.verification.submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SecondaryButton(
                  text: AppLocalizations.of(context)
                      .translate('auth.verification.sendBack'),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
