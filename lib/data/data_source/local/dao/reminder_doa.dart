import 'package:floor/floor.dart';
import 'package:medical_reminder/core/constants/constants.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';

@dao
abstract class ReminderDao {
  @Insert()
  Future<void> insertData(ReminderEntity reminderEntity);

  @Query("SELECT * FROM $tableName")
  Future<List<ReminderEntity?>> getAllReminders();
}
