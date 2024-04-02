// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ReminderDao? _reminderDaoInstance;

  PersonDao? _personDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `reminderTB` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `pillName` TEXT NOT NULL, `date` TEXT NOT NULL, `time` TEXT NOT NULL, `useMode` TEXT NOT NULL, `count` TEXT NOT NULL, `description` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `personTable` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `image` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ReminderDao get reminderDao {
    return _reminderDaoInstance ??= _$ReminderDao(database, changeListener);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }
}

class _$ReminderDao extends ReminderDao {
  _$ReminderDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _reminderEntityInsertionAdapter = InsertionAdapter(
            database,
            'reminderTB',
            (ReminderEntity item) => <String, Object?>{
                  'id': item.id,
                  'pillName': item.pillName,
                  'date': item.date,
                  'time': item.time,
                  'useMode': item.useMode,
                  'count': item.count,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ReminderEntity> _reminderEntityInsertionAdapter;

  @override
  Future<List<ReminderEntity?>> getAllReminders() async {
    return _queryAdapter.queryList('SELECT * FROM reminderTB',
        mapper: (Map<String, Object?> row) => ReminderEntity(
            id: row['id'] as int?,
            pillName: row['pillName'] as String,
            date: row['date'] as String,
            time: row['time'] as String,
            useMode: row['useMode'] as String,
            count: row['count'] as String,
            description: row['description'] as String?));
  }

  @override
  Future<List<ReminderEntity?>> getByDate(String date) async {
    return _queryAdapter.queryList(
        'SELECT * FROM reminderTB WHERE date = ?1 ORDER BY time ASC',
        mapper: (Map<String, Object?> row) => ReminderEntity(
            id: row['id'] as int?,
            pillName: row['pillName'] as String,
            date: row['date'] as String,
            time: row['time'] as String,
            useMode: row['useMode'] as String,
            count: row['count'] as String,
            description: row['description'] as String?),
        arguments: [date]);
  }

  @override
  Future<void> deleteById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM reminderTB WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertData(ReminderEntity reminderEntity) async {
    await _reminderEntityInsertionAdapter.insert(
        reminderEntity, OnConflictStrategy.abort);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _personInfoEntityInsertionAdapter = InsertionAdapter(
            database,
            'personTable',
            (PersonInfoEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image
                }),
        _personInfoEntityUpdateAdapter = UpdateAdapter(
            database,
            'personTable',
            ['id'],
            (PersonInfoEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PersonInfoEntity> _personInfoEntityInsertionAdapter;

  final UpdateAdapter<PersonInfoEntity> _personInfoEntityUpdateAdapter;

  @override
  Future<PersonInfoEntity?> getPersonInfo() async {
    return _queryAdapter.query('SELECT * FROM personTable',
        mapper: (Map<String, Object?> row) => PersonInfoEntity(
            id: row['id'] as int?,
            name: row['name'] as String,
            image: row['image'] as String));
  }

  @override
  Future<void> insertData(PersonInfoEntity personInfoEntity) async {
    await _personInfoEntityInsertionAdapter.insert(
        personInfoEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateInfo(PersonInfoEntity personInfoEntity) async {
    await _personInfoEntityUpdateAdapter.update(
        personInfoEntity, OnConflictStrategy.abort);
  }
}
