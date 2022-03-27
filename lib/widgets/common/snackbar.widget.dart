import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showSuccessSnackBar(BuildContext context, String message) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    message: message,
    borderRadius: BorderRadius.circular(5),
    margin: const EdgeInsets.all(20),
    messageColor: Theme.of(context).colorScheme.onSecondary,
    backgroundColor: Theme.of(context).colorScheme.secondary,
    boxShadows: [
      BoxShadow(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        offset: Offset(0, 3),
        blurRadius: 10,
      ),
    ],
    animationDuration: Duration(milliseconds: 500),
    icon: const Icon(
      Icons.check,
      color: Colors.white,
    ),
    duration: const Duration(seconds: 3),
  )..show(context);
}

void showErrorSnackBar(BuildContext context, String message) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    message: message,
    borderRadius: BorderRadius.circular(5),
    margin: const EdgeInsets.all(20),
    messageColor: Theme.of(context).colorScheme.onError,
    backgroundColor: Theme.of(context).colorScheme.error,
    boxShadows: [
      BoxShadow(
        color: Theme.of(context).colorScheme.error.withOpacity(0.5),
        offset: Offset(0, 3),
        blurRadius: 10,
      ),
    ],
    animationDuration: Duration(milliseconds: 500),
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    duration: const Duration(seconds: 3),
  )..show(context);
}
