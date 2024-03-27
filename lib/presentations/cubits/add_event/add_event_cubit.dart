import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/usecase/insert_reminder.dart';
import 'package:medical_reminder/locator.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

part 'add_event_state.dart';

class AddEventCubit extends Cubit<AddEventState> {
  final InsertReminderUseCase _insertReminderUseCase =
      locator<InsertReminderUseCase>();
  AddEventCubit() : super(AddEventInitial());
  ReminderEntity _reminderEntity = ReminderEntity(
    pillName: '',
    dateTime: Jalali(0).toDateTime().toIso8601String(),
    useMode: '',
  );

  Jalali _date = Jalali(0);

  void setEventData({
    String? pillName,
    String? useMode,
  }) {
    _reminderEntity = _reminderEntity.copyWith(
      pillName: pillName,
      useMode: useMode,
    );
  }

  void setDateTime({
    Jalali? date,
    String? time,
  }) {
    if (date != null) {
      _date = _date.copy(year: date.year, month: date.month, day: date.day);
    }
    if (time != null) {
      _date = _date.copy(
          hour: time.split(':').first.toInt(),
          minute: time.split(':').last.toInt());
    }
  }

  saveData() {
    _reminderEntity = _reminderEntity.copyWith(
        dateTime: _date.toDateTime().toIso8601String());
    if (_reminderEntity.pillName.isNotEmpty &&
        _reminderEntity.useMode.isNotEmpty &&
        _date.year != 0) {
      saveReminderInDb();
    } else {
      emit(Validations(false));
    }
  }

  void saveReminderInDb() async {
    final result = await _insertReminderUseCase(_reminderEntity);
    if (result is DataSuccess) {
      emit(Validations(true));
    }
    if (result is DataFaild) {
      emit(Validations(true));
    }
  }
}
