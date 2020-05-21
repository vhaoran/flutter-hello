import 'dart:convert';

import "package:test/test.dart";

class Root {
  Root();

  Root.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {}
}

class X extends Root {
  X() : super();

  int id;
  String name;

  @override
  factory X.fromJson(Map<String, dynamic> json) {
    return X()
      ..id = json["id"] as int
      ..name = json["name"] as String;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "kd": id,
      "name": name,
    };
  }
}

doGet<T>() {
  String s = '{"id":1,"name":"2"}';
  var m = jsonDecode(s);
  //var y = (T as Root).fromJson(m);
  print("------------------");
  print("------------------");
}

void main() {
  test("String.split() splits the string on the delimiter", () {
    doGet<X>();
  });

  test("String.trim() removes surrounding whitespace", () {
    var string = "  foo ";
    expect(string.trim(), equals("foo"));
  });
}
