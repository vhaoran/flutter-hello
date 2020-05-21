import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

//  flutter packages pub run build_runner build
@JsonSerializable()
class User {
  int id;
  String nick;

  //@JsonKey(name: 'user_code')
  String userCode;
  String name;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
