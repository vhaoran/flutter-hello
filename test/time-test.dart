import "package:test/test.dart";

void main() {
  test("time-test", () async {
    DateTime t = DateTime.now();
    var i  = t.millisecondsSinceEpoch;

    expect(1, equals(1));
    print(" ------------end------------  ");
  });
}
