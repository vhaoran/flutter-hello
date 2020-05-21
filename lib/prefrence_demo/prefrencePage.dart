import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Center(
          child: new StoreTest(),
        ));
  }
}

class StoreTest extends StatefulWidget {
  @override
  _StoreTestState createState() => new _StoreTestState();
}

class _StoreTestState extends State<StoreTest> {
  int count = 0;
  int countGet = 0;

  _set() async {
    count++;
    final prefs = await SharedPreferences.getInstance();
    var f = prefs.setInt('counter', count);
    f.then((v) {
      countGet = prefs.getInt('counter');
    });
  }

  void _get() async {
    final prefs = await SharedPreferences.getInstance();
    countGet = prefs.getInt('counter');
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: () => setState(() {
            _set();
          }),
          child: new Text('count Add = $count'),
        ),
        new RaisedButton(
          onPressed: () => setState(() {
            _get;
          }),
          child: new Text('countGet = $countGet'),
        ),
      ],
    );
  }
}
