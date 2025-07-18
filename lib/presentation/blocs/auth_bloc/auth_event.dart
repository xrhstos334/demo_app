part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = Started;

  const factory AuthEvent.togglePasswordVisibility(bool visibility) = TogglePasswordVisibility;
  const factory AuthEvent.usernameChanged(String username) = UsernameChanged;
  const factory AuthEvent.emailChanged(String email) = EmailChanged;

  const factory AuthEvent.passwordChanged(String password) = PasswordChanged;
  const factory AuthEvent.signIn() = SignIn;


  const factory AuthEvent.connectWithFacebook() = ConnectWithFacebook;
  const factory AuthEvent.connectWithInstagram() = ConnectWithInstagram;
  const factory AuthEvent.connectWithTwitter() = ConnectWithTwitter;

  const factory AuthEvent.connected() = Connected;
  const factory AuthEvent.connectionFailed() = ConnectionFailed;
  const factory AuthEvent.goTo(AuthView view) = GoTo;
  const factory AuthEvent.createAccount() = CreateAccount;
  const factory AuthEvent.resetPassword(String email) = ResetPassword;


}
