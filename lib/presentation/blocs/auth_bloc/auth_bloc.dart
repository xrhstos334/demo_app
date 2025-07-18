import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/firebase/firebase_auth_service.dart';
import '../../providers/auth_status_enums.dart';
part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
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

  void _emailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        email: event.email));
  }
  void _resetPassword(ResetPassword event, Emitter<AuthState> emit) async {
    await FirebaseAuthService().sendPasswordReset(event.email);
    emit(state.copyWith(
      authStatus:  AuthActionStatus.resetSuccess,
    ));
  }
  void _onStarted(Started event, Emitter<AuthState> emit) {
    emit(state.copyWith(
      view: AuthView.login,
    ));
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        togglePasswordVisibility: event.visibility));
  }

  void _onUsernameChanged(
    UsernameChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        username: event.username));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        password: event.password));
  }

  Future<void> _signIn(SignIn event, Emitter<AuthState> emit) async{
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
    Emitter<AuthState> emit,
  ) async {
    final userCredential = await FirebaseAuthService().signInWithFacebook();
    if (emit.isDone) return;

    if (userCredential != null) {
      add(const AuthEvent.connected());
    } else {
      add(const AuthEvent.connectionFailed());
    }
  }

  void _onConnectWithInstagram(
    ConnectWithInstagram event,
    Emitter<AuthState> emit,
  ) {
    // TODO: Implement
  }

  void _onConnectWithTwitter(
    ConnectWithTwitter event,
    Emitter<AuthState> emit,
  ) {
    // TODO: Implement
  }

  void _onConnected(Connected event, Emitter<AuthState> emit) {
    emit(state.copyWith(

        authStatus: AuthActionStatus.loginSuccess));
  }

  void _onConnectionFailed(ConnectionFailed event, Emitter<AuthState> emit) {
    emit(state.copyWith(authStatus: AuthActionStatus.loginFailure));
  }

  void _onGoTo(GoTo event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        authStatus: AuthActionStatus.initial,
        view: event.view));
  }

  Future<void> _onCreateAccount(
    CreateAccount event,
    Emitter<AuthState> emit,
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
        add(AuthEvent.goTo(AuthView.login));
      } else if (state.view == AuthView.signUp) {
        add(AuthEvent.goTo(AuthView.login));
      } else if (state.view == AuthView.login) {
        add(AuthEvent.goTo(AuthView.back));
      }

    }

}
