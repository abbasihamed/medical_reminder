import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/core/usecase/usecase.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';

class InsertReminderUseCase implements UseCaseOne<DataState<bool>, ReminderEntity> {
  final ReminderRepository _reminderRepository;

  const InsertReminderUseCase(this._reminderRepository);

  @override
  Future<DataState<bool>> call(ReminderEntity reminderEntity) async {
    return await _reminderRepository.insertReminder(reminderEntity);
  }
}
