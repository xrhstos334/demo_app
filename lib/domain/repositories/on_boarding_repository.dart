
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
class OnBoardingRepository {


   static Future<Map<String,dynamic>> fetchData() async {
    try {
      final firebaseStorage = FirebaseStorage.instance;
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 1),
      ));
      await remoteConfig.fetchAndActivate();
      final jsonString = remoteConfig.getString('on_boarding_json');
      final Map<String, dynamic> onboardingData = json.decode(jsonString);

      final folder = 'on_boarding/${onboardingData["onboarding_version"]}';
      final result = await firebaseStorage.ref(folder).listAll();
      final urls = await Future.wait(
        result.items.map((ref) => ref.getDownloadURL()),
      );

      return {
        "args" : onboardingData,
        "images": urls,
      };
    } catch (e) {
      return {
        "args": {},
        "images": [],
      };
    }
   }

}