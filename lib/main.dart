
import 'package:demo_app/core/firebase/firebase_service.dart';
import 'package:demo_app/core/theme/app_theme.dart';
import 'package:demo_app/routes/routes.dart';
import 'package:demo_app/routes/routes_generator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:firebase_core/firebase_core.dart';
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
    print("=================> FCM Token: $fcmToken");
  }



  FirebaseService firebaseService = FirebaseService();
  await firebaseService.initFirebase();


  // await setupLocator();
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
  await notificationPlugin.init();
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



