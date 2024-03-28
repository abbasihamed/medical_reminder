import 'package:get_it/get_it.dart';
import 'package:medical_reminder/core/constants/constants.dart';
import 'package:medical_reminder/data/data_source/local/app_database.dart';
import 'package:medical_reminder/data/repository_impl/reminder_repository_impl.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';
import 'package:medical_reminder/domain/usecase/get_by_date.dart';
import 'package:medical_reminder/domain/usecase/insert_reminder.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  final db = await $FloorAppDatabase.databaseBuilder(dbName).build();
  locator.registerSingleton(db);

  locator.registerLazySingleton<ReminderRepository>(
      () => ReminderRepositoryImpl(db.reminderDao));

  locator.registerLazySingleton<InsertReminderUseCase>(
      () => InsertReminderUseCase(locator()));

  locator.registerLazySingleton<GetReminderByDateUseCase>(
      () => GetReminderByDateUseCase(locator()));
}
