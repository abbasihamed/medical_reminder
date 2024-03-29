import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';

abstract class ReminderRepository {
  Future<DataState<bool>> insertReminder(ReminderEntity reminderEntity);
   Future<DataState<List<ReminderEntity?>>> getAllReminders();
  Future<DataState<List<ReminderEntity?>>> getByDate(String date);
}
