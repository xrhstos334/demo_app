part of 'on_boarding_cubit.dart';

@Freezed(equal: false)
abstract class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState({
    @Default(0) int currentPage,
    required OnBoardingStatus status,
    required  List<dynamic> images,
    required  List<dynamic> titles,
    required  List<dynamic> descriptions,
    required  List<dynamic> highlight,
  }) = _OnBoardingState;

  factory OnBoardingState.initial(Map<String , dynamic> args) =>  OnBoardingState(
    status: OnBoardingStatus.loading,
    images: args['images'] as List<dynamic>,
    titles : args['args']['titles'] as List<dynamic>,
    descriptions: args['args']['descriptions'] as List<dynamic>,
    highlight: args['args']['highlights'] as List<dynamic>,
  );


}
