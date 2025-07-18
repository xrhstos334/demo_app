part of 'auth_bloc.dart';

@Freezed(equal: false)
abstract class AuthState with _$AuthState{
  factory AuthState.initial() => AuthState(
  authStatus: AuthActionStatus.initial,
    view: AuthView.login
  );

  const factory AuthState({
    required AuthActionStatus authStatus,
    @Default('') String errorMessage,
    @Default(true) bool togglePasswordVisibility,
    @Default('') String email,
    @Default('') String password,
    @Default('') String username,
    required AuthView view,

  }) = _Initial;
}


