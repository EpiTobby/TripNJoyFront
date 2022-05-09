import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Bonus: define AsyncValue<void> as a typedef that we can
// reuse across multiple widgets and state notifiers
typedef VoidAsyncValue = AsyncValue<void>;

extension AsyncValueUI on VoidAsyncValue {
  bool get isLoading => this is AsyncLoading<void>;

  bool get isError => this is AsyncError<void>;

  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            message: error.toString(),
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
            duration: const Duration(seconds: 10),
          ).show(context);
        },
      );
}
