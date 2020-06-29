import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobias/tobias.dart';

class AliPayDemo extends StatefulWidget {
  @override
  AliPayDemoState createState() => new AliPayDemoState();
}

class AliPayDemoState extends State<AliPayDemo> {
  bool _isInstalled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(
        "hello",
      )),
      body: new ListView(children: [
        new RaisedButton(
          child: new Text("check installed"),
          onPressed: () async {
            var result = await isAliPayInstalled();
            setState(() {
              this._isInstalled = result;
            });
          },
        ),
        new Text("isInstalled:$_isInstalled"),
      ]),
    );
  }
}
