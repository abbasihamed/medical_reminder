import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/resource/data_state.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';
import 'package:medical_reminder/domain/usecase/person_info/get_person.dart';
import 'package:medical_reminder/domain/usecase/person_info/insert_person.dart';
import 'package:medical_reminder/domain/usecase/person_info/update_person.dart';
import 'package:medical_reminder/locator.dart';

part 'person_info_state.dart';

class PersonInfoCubit extends Cubit<PersonInfoState> {
  final InsertPersonInfoUseCase _insertPersonInfoUseCase =
      locator<InsertPersonInfoUseCase>();
  final GetPersonInfoUseCase _getPersonInfoUseCase =
      locator<GetPersonInfoUseCase>();
  final UpdatePersonInfoUseCase _updatePersonInfoUseCase =
      locator<UpdatePersonInfoUseCase>();
  PersonInfoCubit() : super(PersonInfoInitial());

  void setInfo({String? name, String? image}) async {
    final info = await _getPersonInfoUseCase();
    PersonInfoEntity userInfo =
        PersonInfoEntity(name: name ?? '', image: image ?? '');
    if (info is DataSuccess) {
      userInfo = userInfo.copyWith(
        id: info.data?.id,
        name: name ?? info.data!.name,
        image: image ?? info.data!.image,
      );
      print(userInfo);
      _updateData(userInfo);
    }
    if (info is DataFaild) {
      _insertData(userInfo);
    }
  }

  void _insertData(PersonInfoEntity infoEntity) async {
    final result = await _insertPersonInfoUseCase(infoEntity);
    if (result is DataSuccess) {
      emit(GetPersonInfo(result.data));
    }
    if (result is DataFaild) {
      emit(GetPersonInfo(null));
    }
  }

  void _updateData(PersonInfoEntity infoEntity) async {
    final result = await _updatePersonInfoUseCase(infoEntity);
    if (result is DataSuccess) {
      emit(GetPersonInfo(result.data));
    }
    if (result is DataFaild) {
      emit(GetPersonInfo(null));
    }
  }

  void getPersonData() async {
    final result = await _getPersonInfoUseCase();
    if (result is DataSuccess) {
      emit(GetPersonInfo(result.data));
    }
    if (result is DataFaild) {
      emit(GetPersonInfo(null));
    }
  }
}
