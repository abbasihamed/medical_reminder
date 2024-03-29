import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/core/usecase/usecase.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';

class GetAllReminderUseCase
    implements UseCase<DataState<List<ReminderEntity?>>> {
  final ReminderRepository _reminderRepository;

  const GetAllReminderUseCase(this._reminderRepository);
  @override
  Future<DataState<List<ReminderEntity?>>> call() async {
    return await _reminderRepository.getAllReminders();
  }
}
