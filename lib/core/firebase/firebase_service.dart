import 'package:firebase_messaging/firebase_messaging.dart';

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
      print("Message clicked!");
    });
  }

  Future<void> handleKilledAppNotifications(RemoteMessage message) async {}

  firebaseOnMessage(RemoteMessage message) async {
    // Handle the message when the app is in the foreground
    print("Message received: ${message.notification?.title} - ${message.notification?.body}");
    // You can show a dialog, update UI, or perform any action based on the message
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
