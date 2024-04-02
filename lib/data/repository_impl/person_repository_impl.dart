import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/data/data_source/local/dao/person_info_dao.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';
import 'package:medical_reminder/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonDao _personDao;

  const PersonRepositoryImpl(this._personDao);
  @override
  Future<DataState<PersonInfoEntity>> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<DataState<bool>> insertInfo(PersonInfoEntity personInfoEntity) async {
    try {
      await _personDao.insertData(personInfoEntity);
      return const DataSuccess(true);
    } catch (e) {
      return const DataFaild('');
    }
  }

  @override
  Future<DataState<PersonInfoEntity>> updateData(
      PersonInfoEntity personInfoEntity) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
