import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  logger.i("onBackgroundMessage");
  await Firebase.initializeApp();

  if (message.notification!.title!.contains('matchmaking') || message.data.containsKey('matchmaking')) {
    logger.i('Matchmaking notification');
  }
}

Future<void> onMessage(RemoteMessage message) async {
  logger.i("onMessage");
}

class PushNotificationService {
  final FirebaseMessaging _fcm;
  final HttpService httpService;

  PushNotificationService(this.httpService, this._fcm) {
    init();
  }

  Future init() async {
    if (Platform.isIOS) {
      _fcm.requestPermission();
    }
    setNotifications();
  }

  Future<String?> getToken() async {
    final token = await _fcm.getToken();
    logger.i('Firebase Messaging Token: $token');
    return token;
  }

  void setUserToken(int userId) async {
    final token = await getToken();
    if (token != null) {
      httpService.setUserFirebaseToken(userId, token);
    }
  }

  setNotifications() {
    logger.i("Setting notification");
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(onMessage);
  }

  subscribeToTopic(String topic) async {
    await _fcm.subscribeToTopic(topic);
    logger.i("Subscribed to topic: $topic");
  }

  unsubscribeToTopic(String topic) async {
    await _fcm.unsubscribeFromTopic(topic);
    logger.i("Unsubscribed to topic: $topic");
  }
}
