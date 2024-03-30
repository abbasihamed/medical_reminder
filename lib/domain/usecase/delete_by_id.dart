import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/core/usecase/usecase.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';

class DeleteReminderByIdUseCase implements UseCaseOne<DataState<bool>, int> {
  final ReminderRepository _reminderRepository;

  const DeleteReminderByIdUseCase(this._reminderRepository);
  @override
  Future<DataState<bool>> call(int p) async {
    return await _reminderRepository.deleteById(p);
  }
}
