import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/repositories/notifications_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/data_models /notification_model.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';
part 'notifications_bloc.freezed.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final Map<String , dynamic> args;
  NotificationsBloc({
    required this.args
}) : super( NotificationsState.initial(args)) {
    on<Started>( _started);
    on<ClearAll>(_clearAll);
    on<SelectCategory>(_selectCategory);
  }
  void _selectCategory(SelectCategory event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(
      selectedIndex: event.index,
    ));
  }

  void _started(Started event, Emitter<NotificationsState> emit) async {
    List<NotificationModel> notifications = await NotificationsRepository().getNotifications(state.userId);
    final now = DateTime.now();
    final oneDayAgo = now.subtract(Duration(hours: 24));
    List<NotificationModel> recent = [];
    List<NotificationModel> earlier = [];
    for (var notification in notifications) {
      if (DateTime.parse(notification.date!).isAfter(oneDayAgo)) {
        recent.add(notification);
      } else {
        earlier.add(notification);
      }
    }
    emit(state.copyWith(
      earlier: earlier,
      recent: recent,
      archived: notifications.where((n) => n.isArchived ?? false).toList(),
    ));
  }

  void _clearAll(ClearAll event, Emitter<NotificationsState> emit) async {
    await NotificationsRepository().clearNotifications(state.userId);
    emit(state.copyWith(
      recent: [],
      earlier: [],
      archived: [],
    ));
  }

  List<NotificationModel>? getNotifications(int index) {
    if(index == 0) {
      return state.recent;
    } else if (index == 1) {
      return state.earlier;
    } else {
      return state.archived;
    }
  }

}
