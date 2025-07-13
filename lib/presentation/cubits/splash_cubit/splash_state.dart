part of 'splash_cubit.dart';

@Freezed(equal: false)
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loaded(Map<String , dynamic> args) = _Loaded;
}