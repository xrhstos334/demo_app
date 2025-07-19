part of 'details_cubit.dart';

@freezed
abstract class DetailsState with _$DetailsState {
  factory DetailsState.initial(Map<String , dynamic> args) => DetailsState(
   place: args["place"]  as PlacesModel,
    user: args["user"] as AuthUser,
    view : DetailsView.initial,
    placesList: args["places"],
    avatarUrls: args["avatarUrls"] as List<String>,

  );

  const factory DetailsState({
  required PlacesModel place,
    required AuthUser user,
    required DetailsView view,
    required List<PlacesModel> placesList,
    required List<String> avatarUrls,
}) = init;
}
