part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.started() = Started;
  const factory NotificationsEvent.clearAll() = ClearAll;
  const factory NotificationsEvent.selectCategory(int index) = SelectCategory;
}
