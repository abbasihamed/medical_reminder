import 'package:floor/floor.dart';
import 'package:medical_reminder/core/constants/constants.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';

@dao
abstract class ReminderDao {
  @Insert()
  Future<void> insertData(ReminderEntity reminderEntity);

  @Query("SELECT * FROM $reminderTableName")
  Future<List<ReminderEntity?>> getAllReminders();

  @Query(
      "SELECT * FROM $reminderTableName WHERE date = :date ORDER BY time ASC")
  Future<List<ReminderEntity?>> getByDate(String date);

  @Query("DELETE FROM $reminderTableName WHERE id = :id")
  Future<void> deleteById(int id);
}
