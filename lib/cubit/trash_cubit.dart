import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pickup_apps/models/models.dart';
import 'package:pickup_apps/services/services.dart';

part 'trash_state.dart';

class TrashCubit extends Cubit<TrashState> {
  TrashCubit() : super(TrashInitial());

  Future<void> getTrash() async {
    ApiReturnValue<List<Trash>> result = await TrashServices.getTrash();

    if (result.value != null) {
      emit(TrashLoaded(result.value));
    } else {
      emit(TrashLoadingFailed(result.message));
    }
  }
}
