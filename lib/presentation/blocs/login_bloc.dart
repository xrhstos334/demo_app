import 'package:bloc/bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../blocs/login_bloc.dart' hide LoginStatus;


part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super( LoginState.initial()) {
    on<LoginEvent>( _onEvent);
  }

  void _onEvent(LoginEvent event, Emitter<LoginState> emit)async {
     event.map(
      started: (_) => _started(emit),
      togglePasswordVisibility: (e) => _togglePasswordVisibility(emit, e.visibility),
      usernameChanged: (e) => _usernameChanged(emit, e.username),
      passwordChanged: (e) => _passwordChanged(emit, e.password),
      connect: (_Connect value) {  },
      connectWithFacebook: (_) => _connectWithFacebook(emit),
      connectWithInstagram: (_) {  },
      connectWithTwitter: (_) {  },
       connected: (_)=> _connected(emit),
       connectionFailed: (_) => _connectionFailed(emit),
    );
  }

  void _connected(Emitter<LoginState> emit) {
    emit(state.copyWith(loginStatus: LoginStatusView.loginSuccess));
  }

  void _connectionFailed(Emitter<LoginState> emit) {
    emit(state.copyWith(loginStatus: LoginStatusView.loginFailure));
  }


  void _connectWithFacebook(Emitter<LoginState> emit) async {
    final userCredential = await signInWithFacebook();
    if (userCredential != null) {
      add(LoginEvent.connected());
    } else {
      add(const LoginEvent.connectionFailed());
    }
  }


  void _started(Emitter<LoginState> emit) {


    emit(LoginState.initial());
  }
  void _usernameChanged(Emitter<LoginState> emit, String username) {
    emit(state.copyWith(username: username));
  }
  void _passwordChanged(Emitter<LoginState> emit, String password) {
    emit(state.copyWith(password: password));
  }
  void _togglePasswordVisibility(Emitter<LoginState> emit ,bool visibility) {
    emit(state.copyWith(togglePasswordVisibility: visibility));
  }







  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      loginBehavior: LoginBehavior.webOnly,
    );    if(result.status == LoginStatus.success ){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
}
