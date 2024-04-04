import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/core/usecase/usecase.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';
import 'package:medical_reminder/domain/repository/person_repository.dart';

class UpdatePersonInfoUseCase
    implements UseCaseOne<DataState<PersonInfoEntity>, PersonInfoEntity> {
  final PersonRepository _personRepository;

  const UpdatePersonInfoUseCase(this._personRepository);
  @override
  Future<DataState<PersonInfoEntity>> call(PersonInfoEntity p) async {
    return await _personRepository.updateData(p);
  }
}
