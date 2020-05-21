import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WsDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text("return")),
            new _Ctl(),
          ],
        ));
  }
}

class _Ctl extends StatefulWidget {
  @override
  _CtlState createState() => new _CtlState();
}

class _CtlState extends State<_Ctl> {
  //static String url = "ws://127.0.0.1:9999/ws";
  static String url = "ws://192.168.0.99:9999/ws";
  IOWebSocketChannel _chan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chan = new IOWebSocketChannel.connect(url, headers: {
      "Jwt": "test/4",
    });

    _chan.stream.listen((message) {
      print("-------msg-----------");
      print(message);
    }, onError: (err) {
      print("-------error-----------");
      print(err.toString());
    }, onDone: () {
      print("---websocket----done-----------");
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: () {
//            _chan.stream.listen((m) {
//              print("-----------$m-----");
//            });

            _chan.sink.add("ping");
            _chan.sink.add("ping");
            _chan.sink.add("ping");
            _chan.sink.add("ping");
          },
          child: new Text('Increment'),
        ),
//        StreamBuilder(
//          stream: _chan.stream,
//          builder: (context, snapshot) {
//            return Text(snapshot.hasData ? '${snapshot.data}' : 'no data');
//          },
//        )
      ],
    );
  }
}
