import 'package:equatable/equatable.dart';

class ReminderEntity extends Equatable {
  final String pillName;
  final String date;
  final String time;
  final String useMode;
  const ReminderEntity({
    required this.pillName,
    required this.date,
    required this.time,
    required this.useMode,
  });
  @override
  List<Object> get props => [pillName, date, time, useMode];

  ReminderEntity copyWith({
    String? pillName,
    String? date,
    String? time,
    String? useMode,
  }) {
    return ReminderEntity(
      pillName: pillName ?? this.pillName,
      date: date ?? this.date,
      time: time ?? this.time,
      useMode: useMode ?? this.useMode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pillName': pillName});
    result.addAll({'date': date});
    result.addAll({'time': time});
    result.addAll({'useMode': useMode});

    return result;
  }

  @override
  String toString() {
    return 'ReminderEntity(pillName: $pillName, date: $date, time: $time, useMode: $useMode)';
  }
}
