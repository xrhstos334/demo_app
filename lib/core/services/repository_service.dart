


import 'package:demo_app/domain/repositories/on_boarding_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../di/locator.dart';

class RepositoryService {
  OnBoardingRepository onBoardingRepository = OnBoardingRepository(
  firebaseStorage: getIt<FirebaseStorage>(),
  remoteConfig: getIt<FirebaseRemoteConfig>(),

  );
}