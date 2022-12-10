import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/auth/auth_step.enum.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/services/api/codegen.service.dart';
import 'package:trip_n_joy_front/widgets/auth/login.widget.dart';
import 'package:trip_n_joy_front/widgets/auth/signup.widget.dart';
import 'package:trip_n_joy_front/widgets/common/dialog/input_dialog.widget.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: step == AuthStep.LOGIN ? Login(parentContext: context) : SignUp(parentContext: context),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.settings),
              splashRadius: 16,
              onPressed: () {
                showBarModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialog(
                          title: "Change api url",
                          label: "Api url",
                          initialValue: BASE_URL,
                          onConfirm: (value) async {
                            ref.read(apiProvider).updateApiHost(value);
                          });
                    });
              },
            ),
          ),
        ]),
      ),
    );
  }
}
