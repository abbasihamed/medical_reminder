part of 'managereminder_cubit.dart';

sealed class ManagereminderState {}

class ManagereminderInitial extends ManagereminderState {}

class GetAllTodayReminderLoader extends ManagereminderState {}

class GetAllTodayReminder extends ManagereminderState {
  final List<ReminderEntity?> remindersList;
  GetAllTodayReminder(this.remindersList);
}

class GetAllReminderLoader extends ManagereminderState {}

class GetAllReminder extends ManagereminderState {
  final List<ReminderEntity?> remindersList;
  GetAllReminder(this.remindersList);
}

class DeleteReminderError extends ManagereminderState {}
