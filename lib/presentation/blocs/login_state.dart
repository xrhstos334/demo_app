part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState.initial() => LoginState(
  loginStatus: LoginStatus.initial,

  );

  const factory LoginState({
    required LoginStatus loginStatus,
    @Default('') String errorMessage,
    @Default(true) bool togglePasswordVisibility,
    @Default('') String username,
    @Default('') String password,
  }) = _Initial;
}


enum LoginStatus {
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