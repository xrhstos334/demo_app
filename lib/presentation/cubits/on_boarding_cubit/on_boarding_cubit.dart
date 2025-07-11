import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_state.dart';
part 'on_boarding_cubit.freezed.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState.initial());

  void changePage() {
    emit(state.copyWith(currentPage: incrementPageNumber));
  }

  void skip() {
    emit(state.copyWith(currentPage: 3)); // Assuming 3 is the last page
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
}