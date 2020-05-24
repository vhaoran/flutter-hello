import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

class WidgetVisible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("scaffold-demo"),
        ),
        body: new _btn());
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class _btn extends StatefulWidget {
  @override
  _btnState createState() => new _btnState();
}

class _btnState extends State<_btn> {
  List<String> l;

  @override
  void initState() {
    // TODO: implement initState
    l = new List<String>();
    for (var i = 0; i < 5; i++) {
      l.add("_btn_$i");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      child: _lv(),
      onRefresh: () async {
        print("-------on Refresh----------------");
        l = new List<String>();
        for (var i = 0; i < 5; i++) {
          l.add("_btn_$i");
        }
        setState(() {});
      },
      onLoad: () async {
        print("-------on Load----------------");
        int start = l.length;
        for (var i = start; i < start + 2; i++) {
          l.add("_btn_$i");
        }
        setState(() {});
      },
    );
  }

  ListView _lv() {
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
