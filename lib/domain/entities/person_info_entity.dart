import 'package:floor/floor.dart';

import 'package:medical_reminder/core/constants/constants.dart';

@Entity(tableName: personalTableName)
class PersonInfoEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String name;
  final String image;

  PersonInfoEntity({
    this.id,
    required this.name,
    required this.image,
  });

  PersonInfoEntity copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return PersonInfoEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'name': name});
    result.addAll({'image': image});

    return result;
  }

  factory PersonInfoEntity.fromMap(Map<String, dynamic> map) {
    return PersonInfoEntity(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }

  @override
  String toString() => 'PersonInfoEntity(id: $id, name: $name, image: $image)';
}
