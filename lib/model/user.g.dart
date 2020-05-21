// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..nick = json['nick'] as String
    ..userCode = json['userCode'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'nick': instance.nick,
      'userCode': instance.userCode,
      'name': instance.name
    };
