part of 'notifications_bloc.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  factory NotificationsState.initial(args)=> NotificationsState(
    avatarUrls: args["avatars"] as List<String>,
  );

  const factory NotificationsState({
    required List<String> avatarUrls,
  }) = _initial;
}
