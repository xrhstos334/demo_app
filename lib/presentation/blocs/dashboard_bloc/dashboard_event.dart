part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = Started;
  const factory DashboardEvent.goToPage(int page) = GoToPage;
}
