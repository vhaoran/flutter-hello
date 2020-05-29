import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new _ctl();
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class _ctl extends StatefulWidget {
  @override
  _ctlState createState() => new _ctlState();
}

class _ctlState extends State<_ctl> {
  List<String> _l = new List<String>();
  List<String> _result = new List<String>();
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new Column(children: [
          new TextField(
            maxLines: 1,
            maxLength: 10,
            style: new TextStyle(
              fontSize: 20,
            ),
            onChanged: (e) {
              _text = e;
              _result.clear();
              _l.forEach((e) {
                if (e.indexOf(_text) >= 0) {
                  _result.add(e);
                }
                setState(() {});
              });
            },
          ),
        ]),
        new Expanded(
          child: ListView(
            children: _l.map((e) => _line(e)).toList(),
          ),
        ),
      ],
    );
  }

  Container _line(String s) {
    return new Container(
      alignment: Alignment.centerLeft,
      height: 50,
      child: new Text(s),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    for (var i = 0; i < 1000; i++) {
      _l.add("item_$i");
    }
    super.initState();
  }
}
