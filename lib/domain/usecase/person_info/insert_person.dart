import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/core/usecase/usecase.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';
import 'package:medical_reminder/domain/repository/person_repository.dart';

class InsertPersonInfoUseCase
    implements UseCaseOne<DataState<bool>, PersonInfoEntity> {
  final PersonRepository _personRepository;

  const InsertPersonInfoUseCase(this._personRepository);

  @override
  Future<DataState<bool>> call(PersonInfoEntity p) async {
    return await _personRepository.insertInfo(p);
  }
}
