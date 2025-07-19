import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/data_models /places_model.dart';
import '../../../data/data_models /user_auth.dart';
import '../../providers/details_enums.dart';

part 'details_state.dart';
part 'details_cubit.freezed.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final Map<String, dynamic> args;
  DetailsCubit({
  required this.args,
}) : super( DetailsState.initial(args));

  void goTo(DetailsView view) {
    emit(state.copyWith(
      view: view,
    ));
  }

}
