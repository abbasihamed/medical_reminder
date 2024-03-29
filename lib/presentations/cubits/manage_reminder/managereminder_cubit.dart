import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/usecase/get_all_reminder.dart';
import 'package:medical_reminder/domain/usecase/get_by_date.dart';
import 'package:medical_reminder/locator.dart';

part 'managereminder_state.dart';

class ManagereminderCubit extends Cubit<ManagereminderState> {
  final GetReminderByDateUseCase _byDateUseCase =
      locator<GetReminderByDateUseCase>();
  final GetAllReminderUseCase _allReminderUseCase =
      locator<GetAllReminderUseCase>();
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

  void getAllReminder() async {
    emit(GetAllReminderLoader());
    final result = await _allReminderUseCase();
    if (result is DataSuccess) {
      emit(GetAllReminder(result.data!));
    }
    if (result is DataFaild) {
      emit(GetAllReminder([]));
    }
  }
}
