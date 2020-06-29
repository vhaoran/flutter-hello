import "package:test/test.dart";

void main() {
  test("time-test", () async {
    DateTime t = DateTime.now();
    var i = t.millisecondsSinceEpoch;

    expect(1, equals(1));
    print(" ------------end------------  ");
  });

  test("aaaa", () async {
    String s = "abcsadfasdfasdfs";
    var str = s.substring(1, 8);

    print("-----result---$str---------");
    // print("-----result---${r.toJson}---------");

    expect(1, equals(1));
    print(" ------------end------------  ");
  });
}
