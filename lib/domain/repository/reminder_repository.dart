import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';

abstract class ReminderRepository {
  Future<DataState<bool>> insertReminder(ReminderEntity reminderEntity);
  Future<List<ReminderEntity?>> getAllReminders();
}
