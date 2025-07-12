import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

const String darwinNotificationCategoryPlain = 'plainCategory';

const String darwinNotificationCategoryText = 'textCategory';

String title = "";
String description = "";


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

  void setTitle(String titleNotification) {
    title = titleNotification;
  }

  static String getTitle() {
    return title;
  }

  void setDescription(String descriptionNotification) {
    description = descriptionNotification;
  }

  static String getDescription() {
    return description;
  }

  Future<void> cancelNotification(int notificationId) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  Future<void> scheduleNotification(tz.TZDateTime time, int id, String title,
      String body, String payload) async {
    var androidChannelSpecifics = AndroidNotificationDetails(
        "CHANNEL_ID", "CHANNEL_NAME",
        channelDescription: "CHANNEL_DESCRIPTION",
        enableLights: true,
        color: Color(0xffFFFFFF),
        ledColor: Color(0xffFFFFFF),
        ledOnMs: 1000,
        ledOffMs: 5000,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: BigTextStyleInformation(body));
    var iosChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidChannelSpecifics,
      iOS: iosChannelSpecifics,
    );
    if (Platform.isAndroid) {
      await flp.zonedSchedule(
        id,
        title,
        body,
        time,
        platformChannelSpecifics,
        // androidAllowWhileIdle: true,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
        payload: payload,
      );
    }
  }

  Future<void> scheduleNotificationWithAction(tz.TZDateTime time, int id,
      String title, String body, String payload, String actionTitle) async {
    var androidChannelSpecifics =
    AndroidNotificationDetails("CHANNEL_ID", "CHANNEL_NAME",
        channelDescription: "CHANNEL_DESCRIPTION",
        enableLights: true,
        //icon: 'ic_launcher_foreground',
        color: const Color(0xff083A4D),
        ledColor: const Color(0xffEA4C4B),
        ledOnMs: 1000,
        ledOffMs: 5000,
        importance: Importance.max,
        priority: Priority.high,
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction(
            "5",
            actionTitle,
            icon: const DrawableResourceAndroidBitmap('ic_launcher_foreground'),
            contextual: true,
          ),
        ]);
    DarwinNotificationDetails iosNotificationDetails =
    DarwinNotificationDetails(
      categoryIdentifier: darwinNotificationCategoryPlain,
    );
    var platformChannelSpecifics = NotificationDetails(
        android: androidChannelSpecifics, iOS: iosNotificationDetails);
    await flp.zonedSchedule(
      id,
      title,
      body,
      time,
      platformChannelSpecifics,
      // androidAllowWhileIdle: true,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.wallClockTime,
      payload: payload,
    );
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
