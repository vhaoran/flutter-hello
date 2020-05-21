import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dlg.dart';

class LoginPageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("演示跳转"),
        ),
        body: new Column(
          children: [
            new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "home");
                },
                child: new Text("to_home")),
            new RaisedButton(
                onPressed: () {
                  DlgErr(context, "error title", "some thing is wrong!");
                },
                child: new Text("alert")),
          ],
        ));
  }
}
