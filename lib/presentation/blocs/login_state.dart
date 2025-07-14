part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState.initial() => LoginState(
  loginStatus: LoginStatusView.initial,

  );

  const factory LoginState({
    required LoginStatusView loginStatus,
    @Default('') String errorMessage,
    @Default(true) bool togglePasswordVisibility,
    @Default('') String username,
    @Default('') String password,
  }) = _Initial;
}


enum LoginStatusView {
  initial,
  loginWaiting,
  loginSuccess,
  loginFailure,
  passwordResetWaiting,
  passwordResetSuccess,
  passwordResetFailure,
  activationWaiting,
  activationSuccess,
  activationFailure,
}