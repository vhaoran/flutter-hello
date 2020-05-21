import 'package:json_annotation/json_annotation.dart';

part 'abc.g.dart';

//  flutter packages pub run build_runner build
@JsonSerializable()
class Abc {
  int id;

  @JsonKey(name: 'user_code')
  String n;

  Abc();

  factory Abc.fromJson(Map<String, dynamic> json) => _$AbcFromJson(json);

  Map<String, dynamic> toJson() => _$AbcToJson(this);
}
