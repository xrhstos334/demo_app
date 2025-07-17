part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = Started;

  const factory LoginEvent.togglePasswordVisibility(bool visibility) = TogglePasswordVisibility;
  const factory LoginEvent.usernameChanged(String username) = UsernameChanged;
  const factory LoginEvent.emailChanged(String email) = EmailChanged;

  const factory LoginEvent.passwordChanged(String password) = PasswordChanged;
  const factory LoginEvent.signIn() = SignIn;


  const factory LoginEvent.connectWithFacebook() = ConnectWithFacebook;
  const factory LoginEvent.connectWithInstagram() = ConnectWithInstagram;
  const factory LoginEvent.connectWithTwitter() = ConnectWithTwitter;

  const factory LoginEvent.connected() = Connected;
  const factory LoginEvent.connectionFailed() = ConnectionFailed;
  const factory LoginEvent.goTo(AuthView view) = GoTo;
  const factory LoginEvent.createAccount() = CreateAccount;
  const factory LoginEvent.resetPassword(String email) = ResetPassword;


}
