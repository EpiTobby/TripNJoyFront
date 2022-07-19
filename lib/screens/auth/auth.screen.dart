import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/constants/auth/auth_step.enum.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/widgets/auth/login.widget.dart';
import 'package:trip_n_joy_front/widgets/auth/signup.widget.dart';

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
    final step = ref.watch(authProvider).step;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: step == AuthStep.LOGIN ? Login(parentContext: context) : SignUp(parentContext: context),
          ),
        ),
      ),
    );
  }
}
