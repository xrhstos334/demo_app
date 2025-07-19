import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/core/utils/local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../utils/logger.dart';

class FirebaseService {
  Future<void> initFirebase() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );


    ///handle messages from firebase while app is in the background or terminated
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    ///handle messages from firebase while app is open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await firebaseOnMessage(message);
    });

    ///handle click notification when app is in background
    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage message) async {
      Log.i("Message clicked!");
    });
  }

  Future<void> handleKilledAppNotifications(RemoteMessage message) async {}

  firebaseOnMessage(RemoteMessage message) async {
    FirebaseFirestore db =  FirebaseFirestore.instance;

    CollectionReference places = db.collection("notifications");
    await places.add({
      "title": message.notification!.title!,
      "body": message.notification!.body!,
      "date" : DateTime.now().toIso8601String(),
    });
    notificationPlugin.showNotification(
        12345,
        message.notification!.title!,
        message.notification!.body!,
        "local_notification_payload_play_only_foreground");
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
