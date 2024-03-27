import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/data/data_source/local/dao/reminder_doa.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderDao _reminderDao;
  const ReminderRepositoryImpl(this._reminderDao);
  @override
  Future<List<ReminderEntity?>> getAllReminders() async {
    // TODO: implement getAllReminders
    throw UnimplementedError();
  }

  @override
  Future<DataState<bool>> insertReminder(ReminderEntity reminderEntity) async {
    try {
      await _reminderDao.insertData(reminderEntity);
      return const DataSuccess(true);
    } catch (e) {
      return const DataFaild(false);
    }
  }
}
