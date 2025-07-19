import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/repositories/on_boarding_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utils/logger.dart';
part 'splash_state.dart';

part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {


  SplashCubit(
  ) : super(const SplashState.initial());

  Future<void> initialize() async {
    Log.i("SplashCubit initialize started");
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashState.loggedIn());
      Log.i("✅ emitted SplashState.loggedIn");
    } else {
       emit(SplashState.loaded(await OnBoardingRepository.fetchData()));
      Log.i("✅ emitted SplashState.loaded");
    }
  }
}