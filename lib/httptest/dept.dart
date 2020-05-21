import 'package:json_annotation/json_annotation.dart';

part 'dept.g.dart';

//  flutter packages pub run build_runner build
//  flutter packages pub run build_runner watch
@JsonSerializable()
class Dept {
  int id;
  String name;
  int Age;
  String province;
  String city;
  String love;
  String tag1;
  String tag2;

  //@JsonKey(name: 'user_code')

  Dept();

  factory Dept.fromJson(Map<String, dynamic> json) => _$DeptFromJson(json);

  Map<String, dynamic> toJson() => _$DeptToJson(this);
}
