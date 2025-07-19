import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';
part 'notifications_bloc.freezed.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final Map<String , dynamic> args;
  NotificationsBloc({
    required this.args
}) : super( NotificationsState.initial(args)) {
    on<NotificationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
