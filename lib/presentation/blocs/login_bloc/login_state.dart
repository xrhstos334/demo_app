part of 'login_bloc.dart';

@Freezed(equal: false)
abstract class LoginState with _$LoginState {
  factory LoginState.initial() => LoginState(
  authStatus: AuthActionStatus.initial,
    view: AuthView.login
  );

  const factory LoginState({
    required AuthActionStatus authStatus,
    @Default('') String errorMessage,
    @Default(true) bool togglePasswordVisibility,
    @Default('') String email,
    @Default('') String password,
    @Default('') String username,
    required AuthView view,

  }) = _Initial;
}


