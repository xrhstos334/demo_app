import 'package:bloc/bloc.dart';
import 'package:demo_app/core/firebase/firebase_auth_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/data_models /user_auth.dart';


part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super( HomeState.initial()) {
    on<Started>(_started);
  }

  void _started(Started event, Emitter<HomeState> emit) async{
    emit(state.copyWith(
      authUser: FirebaseAuthService().getUserInfo()
    ));
  }
}
