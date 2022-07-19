import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.watch(authProvider);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(children: [
              Text(AppLocalizations.of(context).translate('errors.unexpected'),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center)
            ])),
        PrimaryButton(
            text: AppLocalizations.of(context).translate('common.reconnect'),
            onPressed: () {
              authViewModel.logout();
            })
      ]),
    );
  }
}
