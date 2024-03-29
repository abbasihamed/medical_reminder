import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/usecase/get_by_date.dart';
import 'package:medical_reminder/locator.dart';

part 'managereminder_state.dart';

class ManagereminderCubit extends Cubit<ManagereminderState> {
  final GetReminderByDateUseCase _byDateUseCase =
      locator<GetReminderByDateUseCase>();
  ManagereminderCubit() : super(ManagereminderInitial());

  void getByDate(String date) async {
    emit(GetAllTodayReminderLoader());
    final result = await _byDateUseCase(date);
    if (result is DataSuccess) {
      emit(GetAllTodayReminder(result.data!));
    }
    if (result is DataFaild) {
      emit(GetAllTodayReminder([]));
    }
  }
}
