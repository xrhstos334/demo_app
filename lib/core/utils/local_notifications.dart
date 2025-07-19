import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _flp =
  FlutterLocalNotificationsPlugin();

  FlutterLocalNotificationsPlugin get flp => _flp;

  LocalNotifications._();

  Future<void> init() async {
    var android = const AndroidInitializationSettings('app_icon');
    var iOS = const DarwinInitializationSettings();
    var settings = InitializationSettings(android: android, iOS: iOS);
    if (Platform.isAndroid) {
      await _flp
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
          .requestExactAlarmsPermission();
    }
    await _flp.initialize(
      settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) => onSelectNotification(
          notificationResponse.payload),
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  int generateID() {
    final random = Random();
    int min = 1;
    num max = pow(2, 16);
    /**
     * Generates a positive random integer uniformly distributed on the range
     * from [min], inclusive, to [max], exclusive.
     */
    return (min + random.nextInt(max.toInt() - min));
  }

  Future<void> cancelAllNotification() async {
    await flp.cancelAll();
  }


  Future<void> cancelNotification(int notificationId) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  showNotification(
      int id,
      String title,
      String description,
      String payload,
      ) async {
    int id = generateID();
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      "channel_id",
      "channel_name",
      channelDescription: "Channel_description",
      importance: Importance.max,
      priority: Priority.high,
      color: Color(0xff083A4D),
      ledColor: Color(0xffEA4C4B),
      ledOnMs: 1000,
      // specify a value
      ledOffMs: 5000,
      groupKey: "eu.vidavo.patient",
      setAsGroupSummary: true,
      ticker: 'ticker',
      styleInformation: BigTextStyleInformation(description),
    );
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    if (Platform.isAndroid) {
      await _flp.show(id, title, description, platformChannelSpecifics,
          payload: payload);
    }
  }

  static Future<void> onSelectNotification(
      String? payload) async {
    dev.log("On Select Notification");

  }

  @pragma('vm:entry-point')
  static Future<void> notificationTapBackground(
      NotificationResponse notificationResponse) async {

  }
}

LocalNotifications notificationPlugin = LocalNotifications._();
