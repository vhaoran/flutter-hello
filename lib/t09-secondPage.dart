import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第二页"),
      ),
      body: new Center(
        child: new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text("return")),
      ),
    );
  }
}
