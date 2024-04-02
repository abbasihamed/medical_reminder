import 'package:floor/floor.dart';
import 'package:medical_reminder/core/constants/constants.dart';
import 'package:medical_reminder/domain/entities/person_info_entity.dart';

@dao
abstract class PersonDao {
  @Insert()
  Future<void> insertData(PersonInfoEntity personInfoEntity);

  @Query("SELECT * FROM $personalTableName")
  Future<PersonInfoEntity?> getPersonInfo();

  @Update()
  Future<void> updateInfo(PersonInfoEntity personInfoEntity);

  // @Query("DELETE FROM $personalDbName WHERE id = :id")
  // Future<void> deleteById(int id);
}
