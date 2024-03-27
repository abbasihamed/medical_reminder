import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';

part 'add_event_state.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit() : super(AddEventInitial());
  ReminderEntity _reminderEntity = const ReminderEntity(
    pillName: '',
    date: '',
    time: '',
    useMode: '',
  );

  void setEventData({
    String? pillName,
    String? date,
    String? time,
    String? useMode,
  }) {
    _reminderEntity = _reminderEntity.copyWith(
      pillName: pillName,
      date: date,
      time: time,
      useMode: useMode,
    );
  }

  validateData() {
    if (_reminderEntity.date.isNotEmpty &&
        _reminderEntity.pillName.isNotEmpty &&
        _reminderEntity.time.isNotEmpty &&
        _reminderEntity.useMode.isNotEmpty) {
      emit(const Validations(true));
    } else {
      emit(const Validations(false));
    }
  }
}
