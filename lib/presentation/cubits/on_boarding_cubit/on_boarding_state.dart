part of 'on_boarding_cubit.dart';

@freezed
abstract class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState({
    @Default(0) int currentPage,
    required OnBoardingStatus status,
  }) = _OnBoardingState;

  factory OnBoardingState.initial() =>  OnBoardingState(
    status: OnBoardingStatus.initial
  );


}
