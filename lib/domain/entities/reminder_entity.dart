import 'package:floor/floor.dart';
import 'package:medical_reminder/core/constants/constants.dart';

@Entity(tableName: tableName)
class ReminderEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String pillName;
  final String dateTime;
  final String useMode;
  final String count;
  final String? description;
  ReminderEntity({
    required this.pillName,
    required this.dateTime,
    required this.useMode,
    required this.count,
    this.description,
  });

  ReminderEntity copyWith({
    String? pillName,
    String? dateTime,
    String? useMode,
    String? count,
    String? description,
  }) {
    return ReminderEntity(
      pillName: pillName ?? this.pillName,
      dateTime: dateTime ?? this.dateTime,
      useMode: useMode ?? this.useMode,
      count: count ?? this.count,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pillName': pillName});
    result.addAll({'date': dateTime});
    result.addAll({'useMode': useMode});
    result.addAll({'count': count});
    result.addAll({'description': description});

    return result;
  }

  @override
  String toString() {
    return 'ReminderEntity(pillName: $pillName, date: $dateTime,  useMode: $useMode)';
  }
}
