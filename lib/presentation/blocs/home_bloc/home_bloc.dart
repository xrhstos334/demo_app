import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/core/firebase/firebase_auth_service.dart';
import 'package:demo_app/domain/repositories/home_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;
import '../../../core/utils/logger.dart';
import '../../../data/data_models /places_model.dart';
import '../../../data/data_models /user_auth.dart';
import '../../../data/data_models /weather_model.dart';


part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late FirebaseFirestore db;

  HomeBloc() : super(HomeState.initial()) {
    db = FirebaseFirestore.instance;
    on<Started>(_started);
  }

  void _started(Started event, Emitter<HomeState> emit) async {
    List<Map<String , dynamic>> images = await HomeRepository.fetchImages();

    /// Fetching data from firestore
    List<PlacesModel> placesList = [];
    await db.collection("places").get().then((event) {
      for (var doc in event.docs) {
        Log.i(doc.data().toString());
        placesList.add(PlacesModel.fromJson(doc.data()));
      }
    });

    /// matching images with places
    for (int i = 0; i < placesList.length; i++) {
      final place = placesList[i];

      final match = images.firstWhere(
            (img) {
          if (img['name'] == null) return false;
          final fileName = p.basenameWithoutExtension(img['name']);
          final placeName = place.name;

          return placeName.contains(fileName);
        },
        orElse: () => {},
      );

      place.imageUrl = match.isNotEmpty ? match['url'] : null;
    }

    emit(state.copyWith(
        places: placesList,
        avatarUrls: await HomeRepository.getAvatars(),
        weather: await HomeRepository.getWeather(),
        authUser: FirebaseAuthService().getUserInfo()));
  }
}
