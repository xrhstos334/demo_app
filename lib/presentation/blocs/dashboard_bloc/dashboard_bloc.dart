import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState.initial()) {
    on<Started>(_started);
    on<GoToPage>(_goToPage);
  }


void _goToPage(GoToPage event, Emitter<DashboardState> emit) {
  emit(state.copyWith(currentPage: event.page));
}
void  _started(Started event, Emitter<DashboardState> emit) {
    emit(state);
  }
}
