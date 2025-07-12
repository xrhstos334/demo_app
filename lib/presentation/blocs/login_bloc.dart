import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super( LoginState.initial()) {
    on<LoginEvent>( _onEvent);
  }

  void _onEvent(LoginEvent event, Emitter<LoginState> emit) {
    event.map(
      started: (_) => _started(emit),
      togglePasswordVisibility: (e) => _togglePasswordVisibility(emit, e.visibility),
      usernameChanged: (e) => _usernameChanged(emit, e.username),
      passwordChanged: (e) => _passwordChanged(emit, e.password),
      connect: (_Connect value) {  },
      connectWithFacebook: (_) {  },
      connectWithInstagram: (_) {  },
      connectWithTwitter: (_) {  },
    );
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
}
