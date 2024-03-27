import 'package:floor/floor.dart';
import 'package:medical_reminder/core/constants/constants.dart';

@Entity(tableName: tableName)
class ReminderEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String pillName;
  final String dateTime;
  final String useMode;
  ReminderEntity({
    required this.pillName,
    required this.dateTime,
    required this.useMode,
  });

  ReminderEntity copyWith({
    String? pillName,
    String? dateTime,
    String? useMode,
  }) {
    return ReminderEntity(
      pillName: pillName ?? this.pillName,
      dateTime: dateTime ?? this.dateTime,
      useMode: useMode ?? this.useMode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pillName': pillName});
    result.addAll({'date': dateTime});
    result.addAll({'useMode': useMode});

    return result;
  }

  @override
  String toString() {
    return 'ReminderEntity(pillName: $pillName, date: $dateTime,  useMode: $useMode)';
  }
}
