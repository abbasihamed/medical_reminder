import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/core/usecase/usecase.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';

class GetReminderByDateUseCase
    implements UseCaseOne<DataState<List<ReminderEntity?>>, String> {
  final ReminderRepository _reminderRepository;

  const GetReminderByDateUseCase(this._reminderRepository);
  @override
  Future<DataState<List<ReminderEntity?>>> call(String p) async {
    return await _reminderRepository.getByDate(p);
  }
}
