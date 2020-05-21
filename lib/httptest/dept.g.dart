// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dept _$DeptFromJson(Map<String, dynamic> json) {
  return Dept()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..Age = json['Age'] as int
    ..province = json['province'] as String
    ..city = json['city'] as String
    ..love = json['love'] as String
    ..tag1 = json['tag1'] as String
    ..tag2 = json['tag2'] as String;
}

Map<String, dynamic> _$DeptToJson(Dept instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'Age': instance.Age,
      'province': instance.province,
      'city': instance.city,
      'love': instance.love,
      'tag1': instance.tag1,
      'tag2': instance.tag2
    };
