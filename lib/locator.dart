import 'package:get_it/get_it.dart';
import 'package:medical_reminder/core/constants/constants.dart';
import 'package:medical_reminder/data/data_source/local/app_database.dart';
import 'package:medical_reminder/data/repository_impl/person_repository_impl.dart';
import 'package:medical_reminder/data/repository_impl/reminder_repository_impl.dart';
import 'package:medical_reminder/domain/repository/person_repository.dart';
import 'package:medical_reminder/domain/repository/reminder_repository.dart';
import 'package:medical_reminder/domain/usecase/delete_by_id.dart';
import 'package:medical_reminder/domain/usecase/get_all_reminder.dart';
import 'package:medical_reminder/domain/usecase/get_by_date.dart';
import 'package:medical_reminder/domain/usecase/insert_reminder.dart';
import 'package:medical_reminder/domain/usecase/person_info/get_person.dart';
import 'package:medical_reminder/domain/usecase/person_info/insert_person.dart';
import 'package:medical_reminder/domain/usecase/person_info/update_person.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  final db = await $FloorAppDatabase.databaseBuilder(reminderDbName).build();
  locator.registerSingleton(db);

  locator.registerLazySingleton<ReminderRepository>(
      () => ReminderRepositoryImpl(db.reminderDao));
  locator.registerLazySingleton<PersonRepository>(
      () => PersonRepositoryImpl(db.personDao));

  locator.registerLazySingleton<InsertReminderUseCase>(
      () => InsertReminderUseCase(locator()));

  locator.registerLazySingleton<GetReminderByDateUseCase>(
      () => GetReminderByDateUseCase(locator()));

  locator.registerLazySingleton<GetAllReminderUseCase>(
      () => GetAllReminderUseCase(locator()));

  locator.registerLazySingleton<DeleteReminderByIdUseCase>(
      () => DeleteReminderByIdUseCase(locator()));

  locator.registerLazySingleton<InsertPersonInfoUseCase>(
      () => InsertPersonInfoUseCase(locator()));
  locator.registerLazySingleton<GetPersonInfoUseCase>(
      () => GetPersonInfoUseCase(locator()));
  locator.registerLazySingleton<UpdatePersonInfoUseCase>(
      () => UpdatePersonInfoUseCase(locator()));
}
