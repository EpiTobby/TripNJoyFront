import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/notification/push_notification.service.dart';

final pushNotificationProvider =
    Provider<PushNotificationService>((_) => PushNotificationService(FirebaseMessaging.instance));
