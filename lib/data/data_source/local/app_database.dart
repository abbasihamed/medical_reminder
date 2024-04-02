import 'dart:async';

import 'package:floor/floor.dart';
import 'package:medical_reminder/data/data_source/local/dao/person_info_dao.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:medical_reminder/data/data_source/local/dao/reminder_dao.dart';
import 'package:medical_reminder/domain/entities/reminder_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ReminderEntity, PersonInfoEntity])
abstract class AppDatabase extends FloorDatabase {
  ReminderDao get reminderDao;
  PersonDao get personDao;
}
