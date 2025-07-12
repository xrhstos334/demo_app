part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;

  const factory LoginEvent.togglePasswordVisibility(bool visibility) = _TogglePasswordVisibility;
  const factory LoginEvent.usernameChanged(String username) = _usernameChanged;
  const factory LoginEvent.passwordChanged(String password) = _passwordChanged;
  const factory LoginEvent.connect() = _Connect;


  const factory LoginEvent.connectWithFacebook() = _ConnectWithFacebook;
  const factory LoginEvent.connectWithInstagram() = _ConnectWithGoogle;
  const factory LoginEvent.connectWithTwitter() = _ConnectWithTwitter;

}
