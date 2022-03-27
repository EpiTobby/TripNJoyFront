import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import '../../services/auth/auth.service.dart';
import '../../widgets/common/button.widget.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.authService,
  }) : super(key: key);

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Text(
                AppLocalizations.of(context).translate('errors.unexpected'),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        PrimaryButton(
          text: AppLocalizations.of(context).translate('common.reconnect'),
          onPressed: () {
            authService.logout();
          },
        ),
      ],
    );
  }
}
