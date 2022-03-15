import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';

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
                'Verification',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Please check your email for a verification link.',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),
              InputField(
                label: 'Code',
                hint: 'Enter the code',
                icon: const Icon(Icons.lock),
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              PrimaryButton(
                text: 'Verify',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
