part of 'dashboard_bloc.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  factory DashboardState.initial() => DashboardState();

  const factory DashboardState({
    @Default(0) int currentPage,}
      ) = _Initial;
}
