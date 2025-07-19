
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/core/firebase/firebase_service.dart';
import 'package:demo_app/core/theme/app_theme.dart';
import 'package:demo_app/routes/routes.dart';
import 'package:demo_app/routes/routes_generator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:firebase_core/firebase_core.dart';
import 'core/utils/logger.dart';
import 'firebase_options.dart';

import 'core/utils/local_notifications.dart';

String ? fcmToken;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final token= await FirebaseMessaging.instance.getToken();
  if (token != null) {
    fcmToken = token;
    Log.i("=================> FCM Token: $fcmToken");
  }



  FirebaseService firebaseService = FirebaseService();
  await firebaseService.initFirebase();


  // await setupLocator();
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
  await notificationPlugin.init();

   // await _addNotifications();
  // await addPlaces();




  runApp(const DemoApp());
}



class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.splashScreen,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: child!,
        );
      },
    );
  }
}

Future<void> addPlaces()async{
  FirebaseFirestore db =  FirebaseFirestore.instance;

  CollectionReference places = db.collection("places");
  await places.add({
    "name": "Casa Las Tirtugas",
    "place": "Av Damero, Mexico",
    "rating": 4.9,
    "price": 120,
    "description": "You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC",
    "users": [
      {
        "name": "Chris",
        "comment" : "Great place",
        "rating": 5.0,},
      {
        "name": "George",
        "comment" : "",
        "rating": 2.0,},

      {
        "name": "John",
        "comment" : "Great place",
        "rating": 4.0,},
      {
        "name": "Dimitris",
        "comment" : "",
        "rating": 3.5,},
    ]
  });
  await places.add({
    "name": "Rangauti Resort",
    "place": "Sylhet, Airport Road",
    "rating": 4.0,
    "price": 150,
    "description": "You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC",
    "users": [
      {
        "name": "Chris",
        "comment" : "Great place",
        "rating": 5.0,},
      {
        "name": "George",
        "comment" : "",
        "rating": 2.0,},

      {
        "name": "John",
        "comment" : "Great place",
        "rating": 4.0,},
      {
        "name": "Dimitris",
        "comment" : "",
        "rating": 3.5,},
    ]
  });

}
 Future<void>_addNotifications() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference places = db.collection("notifications");
  await places.add({
    "title": "Welcome to Demo App",
    "body": "Thank you for using our app. We hope you enjoy your experience!",
    "date" : DateTime.now().toIso8601String(),
    "read" : false,
    "isAchieved": false,
  }
  );await places.add({
    "title": "Welcome to Demo App",
    "body": "Thank you for using our app. We hope you enjoy your experience!",
    "date" : DateTime.now().toIso8601String(),
    "read" : false,
    "isAchieved": false,
  }
  );await places.add({
    "title": "Welcome to Demo App",
    "body": "Thank you for using our app. We hope you enjoy your experience!",
    "date" : DateTime.now().toIso8601String(),
    "read" : false,
    "isAchieved": false,
  }
  );
  await places.add({
    "title": "Welcome to Earlier",
    "body": "Thank you for using our app. We hope you enjoy your experience!",
    "date" : DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
    "read" : false,
    "isAchieved": false,
  });

  await places.add({
    "title": "Welcome to Earlier",
    "body": "Thank you for using our app. We hope you enjoy your experience!",
    "date" : DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
    "read" : false,
    "isAchieved": false,
  });  await places.add({
    "title": "Welcome to Earlier",
    "body": "Thank you for using our app. We hope you enjoy your experience!",
    "date" : DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
    "read" : false,
    "isAchieved": false,
  });  await places.add({
    "title": "Welcome to Earlier",
    "body": "Thank you for using our app. We hope you enjoy your experience!",
    "date" : DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
    "read" : false,
    "isAchieved": false,
  });

}