import 'package:flutter_test/flutter_test.dart';

void main() {
  test("aaaa", () {
    var string = "  foo ";
    //expect(string.trim(), equals("foo"));
    print("string = $string");
  });

  test("aaa", () {
    var string = "  foo ";
    expect(string.trim(), equals("foo"));
  });

  test("fib-test", () async {
    var t0 = DateTime.now();
    var n = fib(20 );
    var a = DateTime.now().millisecondsSinceEpoch - t0.millisecondsSinceEpoch;
    print(" ----$a   $n--");

    expect(1, equals(1));
    print(" ------------end------------  ");
  });
}

fib(int n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 2) + fib(n - 1);
}
