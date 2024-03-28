import 'package:flutter_bloc/flutter_bloc.dart';
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
    useMode: '',
    count: '',
    description: '',
    time: '',
    date: Jalali(0).toDateTime().toIso8601String(),
  );

  void setEventData({
    String? pillName,
    String? useMode,
    String? count,
    Jalali? date,
    String? time,
    String? description,
  }) {
    _reminderEntity = _reminderEntity.copyWith(
      pillName: pillName,
      useMode: useMode,
      count: count,
      date: date != null
          ? date.toDateTime().toIso8601String()
          : _reminderEntity.date,
      time: time,
      description: description,
    );
  }

  saveData() {
    if (_reminderEntity.pillName.isNotEmpty &&
        _reminderEntity.useMode.isNotEmpty &&
        _reminderEntity.count.isNotEmpty &&
        _reminderEntity.date.isNotEmpty) {
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
