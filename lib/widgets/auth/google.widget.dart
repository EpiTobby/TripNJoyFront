import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/screens/auth/google_more_info.screen.dart';
import 'package:trip_n_joy_front/widgets/navbar/navbar.widget.dart';
import 'package:trip_n_joy_front/app_localizations.dart';

import '../../providers/auth/auth.provider.dart';
import '../../services/auth/auth.service.dart';

class GoogleSignInButton extends StatefulHookConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends ConsumerState<GoogleSignInButton> {
  final bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )
          : OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            width: 2.0,
            color: Theme
                .of(context)
                .colorScheme
                .secondary,
            style: BorderStyle.solid,
          ),),
          overlayColor: MaterialStateProperty.all(Colors.blue),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: () async {
          await auth.signInWithGoogle(context: context).then((value) =>
              Navigator.push(context, MaterialPageRoute(builder: (_) => GoogleMoreInfo(parentContext: context))));
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  AppLocalizations.of(context).translate("auth.google"),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
