import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/firebase/firebase_auth_service.dart';
import '../../providers/auth_status_enums.dart';
part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<Started>(_onStarted);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignIn>(_signIn);
    on<ConnectWithFacebook>(_onConnectWithFacebook);
    on<ConnectWithInstagram>(_onConnectWithInstagram);
    on<ConnectWithTwitter>(_onConnectWithTwitter);
    on<Connected>(_onConnected);
    on<ConnectionFailed>(_onConnectionFailed);
    on<GoTo>(_onGoTo);
    on<CreateAccount>(_onCreateAccount);
    on<ResetPassword>(_resetPassword);
    on<EmailChanged>(_emailChanged);

  }

  void _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        email: event.email));
  }
  void _resetPassword(ResetPassword event, Emitter<LoginState> emit) async {
    await FirebaseAuthService().sendPasswordReset(event.email);
    emit(state.copyWith(
      authStatus:  AuthActionStatus.resetSuccess,
    ));
  }
  void _onStarted(Started event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      view: AuthView.login,
    ));
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        togglePasswordVisibility: event.visibility));
  }

  void _onUsernameChanged(
    UsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        username: event.username));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        password: event.password));
  }

  Future<void> _signIn(SignIn event, Emitter<LoginState> emit) async{
    var user = await FirebaseAuthService().signInWithEmailAndPassword(
        email: state.email, password: state.password);
    emit(
      state.copyWith(
        authStatus: user == null ? AuthActionStatus.message : AuthActionStatus.loginSuccess,
        view: AuthView.login,
        errorMessage: user == null ? 'Login failed. Please try again.' : '',
      ),
    );

  }

  Future<void> _onConnectWithFacebook(
    ConnectWithFacebook event,
    Emitter<LoginState> emit,
  ) async {
    final userCredential = await FirebaseAuthService().signInWithFacebook();
    if (emit.isDone) return;

    if (userCredential != null) {
      add(const LoginEvent.connected());
    } else {
      add(const LoginEvent.connectionFailed());
    }
  }

  void _onConnectWithInstagram(
    ConnectWithInstagram event,
    Emitter<LoginState> emit,
  ) {
    // TODO: Implement
  }

  void _onConnectWithTwitter(
    ConnectWithTwitter event,
    Emitter<LoginState> emit,
  ) {
    // TODO: Implement
  }

  void _onConnected(Connected event, Emitter<LoginState> emit) {
    emit(state.copyWith(

        authStatus: AuthActionStatus.loginSuccess));
  }

  void _onConnectionFailed(ConnectionFailed event, Emitter<LoginState> emit) {
    emit(state.copyWith(authStatus: AuthActionStatus.loginFailure));
  }

  void _onGoTo(GoTo event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        view: event.view));
  }

  Future<void> _onCreateAccount(
    CreateAccount event,
    Emitter<LoginState> emit,
  ) async {
    final response = await FirebaseAuthService().signUpWithEmailUsernameAndPassword(
      username: state.username,
      email: state.email,
      password: state.password,
    );
    emit(state.copyWith(
      authStatus: AuthActionStatus.message,
      view: response ? AuthView.login : AuthView.signUp,
      errorMessage: response ? 'Your account created!' : 'Sign up failed. Please try again.',
    ));
    }


    backButtonNavigationAuth(){
      if (state.view == AuthView.forgotPassword) {
        add(LoginEvent.goTo(AuthView.login));
      } else if (state.view == AuthView.signUp) {
        add(LoginEvent.goTo(AuthView.login));
      } else if (state.view == AuthView.login) {
        add(LoginEvent.goTo(AuthView.back));
      }

    }

}
