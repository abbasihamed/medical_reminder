import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';
import 'package:medical_reminder/domain/usecase/person_info/insert_person.dart';
import 'package:medical_reminder/locator.dart';

part 'person_info_state.dart';

class PersonInfoCubit extends Cubit<PersonInfoState> {
  final InsertPersonInfoUseCase _insertPersonInfoUseCase =
      locator<InsertPersonInfoUseCase>();
  PersonInfoCubit() : super(PersonInfoInitial());

  void insertInfo({String? name = '', String? image = ''}) async {
    final userInfo = PersonInfoEntity(name: name!, image: image!);
    final result = await _insertPersonInfoUseCase(userInfo);
    if (result is DataSuccess) {}
    if (result is DataFaild) {}
  }
}
