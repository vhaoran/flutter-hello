import 'dart:io';

import "package:test/test.dart";

//import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocket_manager/websocket_manager.dart';

void main() {
  test("", () async {
    final String url = "ws://127.0.0.1:9999/ws";
    //final String url = "ws://echo.websocket.org";
    final IOWebSocketChannel conn = new IOWebSocketChannel.connect(url, headers: {
      "Jwt": "test/4",
    });

    //
    conn.stream.listen((message) {
      print("-------msg-----------");
      print(message);
    }, onError: (err) {
      print("-------error-----------");
      print(err.toString());
    }, onDone: () {
      print("-------done-----------");
    });

    print("---after stream----");

    //sleep(Duration(seconds: 500));
    while (true) {}
    // print("-----result---${r.toJson}---------");

    expect(1, equals(1));
    print(" ------------end------------  ");
  });

  test("2-ws", () async {
    int messageNum = 0;
    // Configure WebSocket url
    //final socket = WebsocketManager('wss://echo.websocket.org');
    final String url = "ws://127.0.0.1:9999/ws";
    final socket = WebsocketManager(url, {
      "Jwt": "test/4",
    });
    // Listen to close message
    socket.onClose((dynamic message) {
      print('close');
    });
    //------------------------------------------------
    // Listen to server messages
    socket.onMessage((dynamic message) {
      print('recv: $message');
      if (message == 10) {
        socket.close();
      } else {
        messageNum += 1;
        final String msg = '$messageNum: ${DateTime.now()}';
        print('send: $msg');
        socket.send(msg);
      }
    });

    //------------------------------------------------
    // Connect to server
    await socket.connect();
    while (true) {}

    expect(1, equals(1));
    print(" ------------end------------  ");
  });

  test("bbbb", () async {
    final String url = "ws://127.0.0.1:9999/ws";

    var channel = IOWebSocketChannel.connect(url, headers: {
      "Jwt": "test/4",
    });

    channel.sink.add("connected!");
    channel.sink.add("ping");
    channel.sink.add("ping");
    channel.sink.add("ping");
    channel.sink.add("ping");
    channel.sink.add("ping");
    channel.stream.listen((message) {
      print("-------$message-----------");
    });

    //while (true) {}
    expect(1, equals(1));
    print(" ------------end------------  ");
  });
}
