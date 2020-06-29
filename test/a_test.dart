import "package:test/test.dart";

void main() {
  test("String.split() splits the string on the delimiter", () {
    var string = "foo,bar,baz";

    //------------------------------------------------
    var a = 3;
    print("-- $a---------------------");
    print("-- $a---------------------");

    expect(string.split(","), equals(["foo", "bar", "baz"]));
  });
}
