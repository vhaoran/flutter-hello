import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/mq/mqtt-class.dart';

import 'package:event_bus/event_bus.dart';
import 'package:mqtt_client/mqtt_client.dart';

//-------for event bus start-------
EventBus gEventBus = EventBus();

class OnMessageEvent {
  String topic;
  String payload;

  OnMessageEvent(this.topic, this.payload);

  @override
  toString() {
    return '<$topic>:<$payload>';
  }
}
//-------for event bus end----------------

class MqView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("微聊IM系统--登录"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10),
        child: new _ctl(),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class _ctl extends StatefulWidget {
  @override
  _ctlState createState() => new _ctlState();
}

class _ctlState extends State<_ctl> {
  MqWatch mq;

  List<OnMessageEvent> _msgList = List();
  var _msgSubscription;

  @override
  initState() {
    super.initState();

    mq = MqWatch.getInstance();
    mq.callback = (topic, payload) {
      gEventBus.fire(OnMessageEvent(topic, payload));
    };

    _msgSubscription = gEventBus.on<OnMessageEvent>().listen((event) {
      setState(() {
        // circle list
        while (_msgList.length > 20) {
          _msgList.removeAt(20);
        }

        print("${_msgList.toString()}");

        if (_msgList.length > 0) {
          _msgList.insert(0, event);
        } else {
          _msgList.add(event);
        }
      });
    });
  }

  @override
  void dispose() {
    print("--########  dispose  ##############----------------");
    //取消订阅
    _msgSubscription.cancel();
    mq.disconnect();

    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> _call() async {
    //mq = MqWatch.getInstance();
    await mq.connect();
    mq.client.subscribe("hello", MqttQos.atLeastOnce);
    mq.client.subscribe("hello", MqttQos.atLeastOnce);
    mq.client.subscribe("hello", MqttQos.atLeastOnce);
    mq.client.subscribe("hello_1", MqttQos.atLeastOnce);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _call(),
        builder: (context, snap) {
          String c = "none";
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasError) {
              c = "error";
            }
            c = "done";
          } else if (snap.connectionState == ConnectionState.waiting) {
            c = "waiting";
          }

          return ListView(children: [
            new Text(c,
                style: TextStyle(
                  fontSize: 30,
                )),
            RaisedButton(
              child: new Text('Second Page'),
              onPressed: () async {
                print("-------mq-----------");
                print('port: ${mq.port} host: ${mq.server}');
                for (var i = 0; i < 100; i++) {
                  mq.publishMessage(" $i -> xxxx ");
                }
              },
            ),
            new Column(
                children: _msgList
                    .map((e) => ListTile(
                          title: Text(e.topic,
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text(e.payload),
                          leading: new Icon(Icons.account_box,
                              color: Colors.redAccent),
                        ))
                    .toList()),
          ]);
        });
  }
}
