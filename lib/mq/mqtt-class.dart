import 'dart:convert';
import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:typed_data/typed_buffers.dart';

class MqWatch {
  String server = "192.168.0.201";
  int port = 1883;
  String clientIdentifier = "whr-test-client-1";
  String subTopic = "topic";
  String publishTopic = "topic";
  MqttQos qos = MqttQos.atLeastOnce;
  MqttClient client;
  static MqWatch _instance;

  MqWatch._() {
    print('MqWatch._()->port $port host: $server ');

    client = MqttClient.withPort(server, clientIdentifier, port);

    ///连接成功回调
    client.onConnected = _onConnected;

    ///连接断开回调
    client.onDisconnected = _onDisconnected();

    ///订阅成功回调
    client.onSubscribed = _onSubscribed;


    ///订阅失败回调
    client.onSubscribeFail = _onSubscribeFail;
  }

  static MqWatch getInstance() {
    if (_instance == null) {
      _instance = MqWatch._();
    }
    return _instance;
  }

  ///连接
  Future<MqttClientConnectionStatus> connect() async {
    return await client.connect();
    //_log("connecting");
  }

  ///断开连接
  disconnect() {
    client.disconnect();
    _log("disconnect");
  }

  ///发布消息
  publishMessage(String msg) {
    ///int数组
    Uint8Buffer uint8buffer = Uint8Buffer();

    ///字符串转成int数组 (dart中没有byte) 类似于java的String.getBytes?
    var codeUnits = msg.codeUnits;
    //uint8buffer.add()
    uint8buffer.addAll(codeUnits);
    client.publishMessage(publishTopic, qos, uint8buffer);
  }

  Function(String topic, String payload) callback;

  ///消息监听
  _onData(List<MqttReceivedMessage<MqttMessage>> data) {
    Uint8Buffer buffer = Uint8Buffer();
    var mq_buffer = MqttByteBuffer(buffer);

    data.forEach((MqttReceivedMessage<MqttMessage> m) {
      // 将数据写入到messageStream数组中
      //m.payload.writeTo(mq_buffer);
      // 打印出来
      print("----${m.topic}--------------");
      final MqttPublishMessage recMess = m.payload as MqttPublishMessage;
      final String body =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      //------------------------------------------------
      print("------------------");
      print(body);
      if (this.callback != null) {
        callback(m.topic, body);
      }
    });
  }

  _onConnected() {
    _log("_onConnected");

    ///连接成功的时候订阅消息
    client.subscribe(subTopic, qos);
  }

  _onDisconnected() {
    _log("_onDisconnect");
  }

  _onSubscribed(String topic) {
    _log("_onSubscribed");

    ///在订阅成功的时候注册消息监听
    client.updates.listen(_onData);
  }

  _onSubscribeFail(String topic) {
    _log("_onSubscribeFail");
  }

  _log(String msg) {
    print("MQTT-->$msg");
  }
}
