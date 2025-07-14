import Flutter
import UIKit
import flutter_local_notifications
import Firebase
import FirebaseCore
import FirebaseMessaging

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "flutter/app_metadata", binaryMessenger: controller.binaryMessenger)

        channel.setMethodCallHandler { call, result in
          if call.method == "getReleaseDate" {
            let releaseDate = Bundle.main.infoDictionary?["RELEASE_DATE"] as? String
            result(releaseDate)
          } else {
            result(FlutterMethodNotImplemented)
          }
        }

//        // Configure Firebase
//        FirebaseApp.configure()

        // Set up local notifications plugin
        FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
            GeneratedPluginRegistrant.register(with: registry)
        }

        // Set UNUserNotificationCenter delegate for iOS 10 and above
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        }

//        // Set Firebase messaging delegate
//        Messaging.messaging().delegate = self
//
//        // Set up method channel for Flutter to native communication
//        if let controller = window?.rootViewController as? FlutterViewController {
//            methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: controller.binaryMessenger)
//        }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
