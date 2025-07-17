part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {

  factory HomeState.initial() => HomeState(
  );

  const factory HomeState({
    AuthUser? authUser,
}) = _Initial;
}
