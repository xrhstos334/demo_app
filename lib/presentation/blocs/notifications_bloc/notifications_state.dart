part of 'notifications_bloc.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  factory NotificationsState.initial(args)=> NotificationsState(
    avatarUrls: args["avatars"] as List<String>,
    userId: args["userId"] as String,
  );

  const factory NotificationsState({
    required List<String> avatarUrls,
    required String userId,
    List<NotificationModel>? recent,
    @Default(0) int selectedIndex,
    List<NotificationModel>? earlier,
    List<NotificationModel>? archived,

  }) = _initial;
}
