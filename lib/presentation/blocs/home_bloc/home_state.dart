part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {

  factory HomeState.initial() => HomeState(
    places: [],
    avatarUrls: []
  );

  const factory HomeState({
    AuthUser? authUser,
    required List<PlacesModel> places,
    WeatherModel? weather,
    required List<String> avatarUrls ,
}) = _Initial;
}
