import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconDemoPage extends StatelessWidget {
  final snackBar = new SnackBar(content: new Text('这是一个SnackBar!'));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text("return")),
            new GestureDetector(
              onTap: () {
                final snackBar =
                    new SnackBar(content: new Text('这是一个SnackBar'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: new Text('显示SnackBar'),
            ),
            Row(children: [
              Icon(Icons.add),
              Icon(Icons.ac_unit),
              Icon(Icons.account_box),
              Icon(Icons.accessibility_new)
            ])
          ],
        ));
  }
}
