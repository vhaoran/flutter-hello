import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetVisible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("微聊IM系统--登录"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10),
        child: new _btn(),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class _btn extends StatefulWidget {
  @override
  _btnState createState() => new _btnState();
}

class _btnState extends State<_btn> {
  bool _show = true;
  List<String> l;

  @override
  void initState() {
    // TODO: implement initState
    l = new List<String>();
    for (var i = 0; i < 100; i++) {
      l.add("_btn_$i");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: l
          .map((s) => new RaisedButton(
                onPressed: () {
                  int i = l.indexOf(s);
                  //setState(() {});
                  if (i >= 0 && i < l.length) {
                    l.removeAt(i);
                    setState(() {});
                  }
                },
                child: new Text("$s"),
              ))
          .toList(),
    );
  }
}
