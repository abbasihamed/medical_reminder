import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';

abstract class PersonRepository {
  Future<DataState<PersonInfoEntity>> insertInfo(PersonInfoEntity personInfoEntity);
  Future<DataState<PersonInfoEntity>> getData();
  Future<DataState<PersonInfoEntity>> updateData(PersonInfoEntity personInfoEntity);
}
