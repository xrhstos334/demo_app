import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import '../services/repository_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FirebaseRemoteConfig>(
        () => FirebaseRemoteConfig.instance,
  );

  getIt.registerLazySingleton<FirebaseStorage>(
        () => FirebaseStorage.instance,
  );

  getIt.registerLazySingleton(() => RepositoryService());

}