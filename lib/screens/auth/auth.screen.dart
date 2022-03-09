import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/auth/auth_step.enum.dart';
import 'package:trip_n_joy_front/providers/auth/auth_step.provider.dart';

import '../../widgets/auth/login.widget.dart';
import '../../widgets/auth/signup.widget.dart';

class Auth extends StatefulHookConsumerWidget {
  const Auth({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AuthState();
}

class _AuthState extends ConsumerState<Auth> {
  @override
  Widget build(BuildContext context) {
    final step = ref.watch(authStepProvider) as AuthStep;
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: step == AuthStep.LOGIN ? Login() : SignUp())));
  }
}
