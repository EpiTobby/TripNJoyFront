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
    final token = _fcm.getToken().then((value) => logger.i('Firebase Messaging Token: $value'));
  }
}
