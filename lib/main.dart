import 'package:demo_app/core/theme/app_theme.dart';
import 'package:demo_app/routes/routes.dart';
import 'package:demo_app/routes/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:firebase_core/firebase_core.dart';
import 'core/di/locator.dart';
import 'firebase_options.dart';

import 'core/utils/local_notifications.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();


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




