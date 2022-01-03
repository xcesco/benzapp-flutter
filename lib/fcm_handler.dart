import 'dart:async';

import 'package:benzapp_flutter/repositories/model/notification.dart'
    as app_notification;
import 'package:benzapp_flutter/repositories/persistence/app_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app_debug.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('_firebaseMessagingBackgroundHandler');
  print("Handling a background message: ${message.messageId}");

  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final int value = await database.notificationDao.insert(
      app_notification.Notification(message.notification?.body ?? 'unknown'));
  AppDebug.log('Nuovo rifornimento registrato ${value}');
  print("Registred notification: ${message.notification?.body ?? 'unknown'}");
}
