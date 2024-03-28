import 'package:floor/floor.dart';
import 'package:medical_reminder/core/constants/constants.dart';

@Entity(tableName: tableName)
class ReminderEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String pillName;
  final String date;
  final String time;
  final String useMode;
  final String count;
  final String? description;
  ReminderEntity({
    required this.pillName,
    required this.date,
    required this.time,
    required this.useMode,
    required this.count,
    this.description,
  });

  ReminderEntity copyWith({
    String? pillName,
    String? date,
    String? time,
    String? useMode,
    String? count,
    String? description,
  }) {
    return ReminderEntity(
      pillName: pillName ?? this.pillName,
      date: date ?? this.date,
      time: time ?? this.time,
      useMode: useMode ?? this.useMode,
      count: count ?? this.count,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pillName': pillName});
    result.addAll({'date': date});
    result.addAll({'useMode': useMode});
    result.addAll({'count': count});
    result.addAll({'description': description});

    return result;
  }

  @override
  String toString() {
    return 'ReminderEntity(pillName: $pillName, date: $date, time: $time ,useMode: $useMode description: $description)';
  }
}
