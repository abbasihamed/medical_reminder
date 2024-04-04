part of 'person_info_cubit.dart';

sealed class PersonInfoState {}

class PersonInfoInitial extends PersonInfoState {}

final class GetPersonInfo extends PersonInfoState {
  final PersonInfoEntity? personInfoEntity;
  GetPersonInfo(this.personInfoEntity);
}
