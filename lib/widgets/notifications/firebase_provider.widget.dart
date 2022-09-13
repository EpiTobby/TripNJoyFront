import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trip_n_joy_front/constants/navbar/navbar.enum.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/providers/user/user.provider.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class FirebaseProvider extends HookConsumerWidget {
  const FirebaseProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchmakingViewModel = ref.watch(matchmakingProvider.notifier);
    final navbarProvider = ref.watch(navbarStateProvider.notifier);
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      logger.i("onMessageOpenedApp");
      await Firebase.initializeApp();
      if (message.notification!.title!.contains('matchmaking') || message.data.containsKey('matchmaking')) {
        logger.i('Opened matchmaking notification');
        matchmakingViewModel.receiveGroupMatch();
        navbarProvider.navigate(NavbarPage.MATCHMAKING);
      }
    });

    FirebaseMessaging.onMessage.listen(
      (message) async {
        logger.i('onMessage: title: ${message.notification!.title!}');
        logger.i('onMessage: body: ${message.notification!.body!}');

        if (message.notification!.title!.contains('matchmaking') || message.data.containsKey('matchmaking')) {
          matchmakingViewModel.receiveGroupMatch();
        }

        final user = ref.read(userProvider);
        if (user.value != null && user.value!.id!.toString() != message.data['sender']) {
          showSimpleNotification(
            Text(message.notification!.title!), // use translation
            subtitle: Text(message.notification!.body!),
            foreground: Theme.of(context).colorScheme.onBackground,
            background: Theme.of(context).colorScheme.background,
            position: NotificationPosition.top,
            context: context,
          );
        }
      },
    );
    return child;
  }
}
