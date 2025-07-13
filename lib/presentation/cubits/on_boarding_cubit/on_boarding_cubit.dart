
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_state.dart';

part 'on_boarding_cubit.freezed.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {

  final Map<String , dynamic> args;

  OnBoardingCubit({
  required this.args})
      : super(OnBoardingState.initial(args));

  void changePage() {
    emit(state.copyWith(
      currentPage: incrementPageNumber,
      status: state.currentPage == state.titles.length -1
          ? OnBoardingStatus.complete
          : OnBoardingStatus.initial,
    ));
  }

  void skip() {
    emit(state.copyWith(status: OnBoardingStatus.skip));
  }

  Future<void> init() async {
    emit(state.copyWith(status: OnBoardingStatus.loaded));

  }

  int get incrementPageNumber {
    if (state.currentPage >= 2) {
      return state.currentPage;
    } else {
      return state.currentPage + 1;
    }
  }
}

enum OnBoardingStatus {
  initial,
  loading,
  loaded,
  error,
  skip,
  complete,
  disabled,
}
