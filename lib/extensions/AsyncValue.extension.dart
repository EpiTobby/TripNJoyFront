import 'dart:async';

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
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(days: 1),
            behavior: SnackBarBehavior.floating,
            elevation: 6,
            backgroundColor: Theme.of(context).colorScheme.error,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(error.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onError)),
                IconButton(
                  splashRadius: 20,
                  enableFeedback: false,
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                ),
              ],
            ),
          ));
        },
      );
}
