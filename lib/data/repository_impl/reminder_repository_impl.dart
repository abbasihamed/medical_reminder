import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/data/data_source/local/dao/reminder_dao.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderDao _reminderDao;
  const ReminderRepositoryImpl(this._reminderDao);
  @override
  Future<DataState<List<ReminderEntity?>>> getAllReminders() async {
    try {
      final result = await _reminderDao.getAllReminders();
      return DataSuccess(result);
    } catch (e) {
      print(e.toString());
      return DataFaild(e.toString());
    }
  }

  @override
  Future<DataState<bool>> insertReminder(ReminderEntity reminderEntity) async {
    try {
      await _reminderDao.insertData(reminderEntity);
      return const DataSuccess(true);
    } catch (e) {
      return const DataFaild('');
    }
  }

  @override
  Future<DataState<List<ReminderEntity?>>> getByDate(String date) async {
    try {
      final result = await _reminderDao.getByDate(date);
      return DataSuccess(result);
    } catch (e) {
      print(e.toString());
      return DataFaild(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteById(int id) async {
    try {
      await _reminderDao.deleteById(id);
      return  const DataSuccess(true);
    } catch (e) {
      return const DataFaild('');
    }
  }
}
