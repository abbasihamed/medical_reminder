part of 'add_event_cubit.dart';

sealed class AddEventState {
  const AddEventState();
}

class AddEventInitial extends AddEventState {}

class Validations extends AddEventState {
  final bool isValid;

  const Validations(this.isValid);
}
