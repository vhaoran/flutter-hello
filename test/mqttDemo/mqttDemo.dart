import 'package:mqtt_client/mqtt_client.dart';
import "package:test/test.dart";

import '../../lib/mq/mqtt-class.dart';

void main() {
  test("test", () async {
    MqWatch obj = MqWatch.getInstance();
    var x = await obj.connect();

    print("------------------");
    print("-------after connect,status: ${x.toString()}-----------");

    //obj.client.subscribe(topic, qosLevel)

    //obj.connect();
    for (int i = 0; i < 100; i++) {
      obj.publishMessage("-  $i --  good,hello every one!!!!");
    }
    expect(1, equals(1));
    print(" ------------end------------  ");
  });
}
