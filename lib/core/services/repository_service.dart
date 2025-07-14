import 'package:demo_app/domain/repositories/on_boarding_repository.dart';

class RepositoryService {
  late final OnBoardingRepository onBoardingRepository;

  RepositoryService() {
    onBoardingRepository = OnBoardingRepository(
      // firebaseStorage: getIt<FirebaseStorage>(),
      // remoteConfig: getIt<FirebaseRemoteConfig>(),
    );
  }
}