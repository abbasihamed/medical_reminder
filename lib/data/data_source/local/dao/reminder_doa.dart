import 'package:floor/floor.dart';
import 'package:medical_reminder/core/constants/constants.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';

@dao
abstract class ReminderDao {
  @Insert()
  Future<void> insertData(ReminderEntity reminderEntity);

  @Query("SELECT * FROM $tableName")
  Future<List<ReminderEntity?>> getAllReminders();

  @Query("SELECT * FROM $tableName WHERE date = :date ORDER BY time ASC")
  Future<List<ReminderEntity?>> getByDate(String date);

  @Query("DELETE FROM $tableName WHERE id = :id")
  Future<void> deleteById(int id);
}
