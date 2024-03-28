part of 'managereminder_cubit.dart';

sealed class ManagereminderState {}

class ManagereminderInitial extends ManagereminderState {}

class GetAllTodayReminderLoader extends ManagereminderState {}

class GetAllTodayReminder extends ManagereminderState {
  final List<ReminderEntity?> remindersList;
  GetAllTodayReminder(this.remindersList);
}
