import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/repositories/on_boarding_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';

part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  final OnBoardingRepository onBoardingRepository;

  SplashCubit({
    required this.onBoardingRepository,
  }) : super(const SplashState.initial());

  Future<void> initialize() async {
    emit(SplashState.loaded(await onBoardingRepository.fetchData()));
  }
}
