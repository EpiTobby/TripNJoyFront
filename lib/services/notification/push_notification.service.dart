import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../log/logger.service.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  logger.i("onBackgroundMessage");
  await Firebase.initializeApp();

  if (message.notification!.title!.contains('matchmaking') || message.data.containsKey('matchmaking')) {
    logger.i('Matchmaking notification');
  }
}

class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm) {
    init();
  }

  Future init() async {
    if (Platform.isIOS) {
      _fcm.requestPermission();
    }
  }

  setNotifications() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        if (message.data.containsKey('data')) {
          logger.i('PushNotificationService: data: ${message.data['data']}');
        }
        if (message.data.containsKey('notification')) {
          logger.i('PushNotificationService: notification: ${message.data['notification']}');
        }
        logger.i('PushNotificationService: title: ${message.notification!.title!}');
        logger.i('PushNotificationService: body: ${message.notification!.body!}');
      },
    );
    // With this token you can test it easily on your phone
    final token = _fcm.getToken().then((value) => logger.i('Firebase Messaging Token: $value'));
  }
}
