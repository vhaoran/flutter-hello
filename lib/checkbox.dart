import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title"),
      ),
      body: new _ctl(),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class _ctl extends StatefulWidget {
  @override
  _ctlState createState() => new _ctlState();
}

// ignore: camel_case_types
class _ctlState extends State<_ctl> {
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new RaisedButton(
          onPressed: () {},
          child: new Text('Increment'),
        ),
        Checkbox(
          value: this._check,
          onChanged: (e) {
            print("####  $e ######");
            this._check = e;
            this.setState(() {
              //this._check = !this._check;
            });
          },
        ),
      ],
    );
  }
}
