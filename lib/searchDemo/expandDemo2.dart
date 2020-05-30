import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandDemoPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            new Column(children: [
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("return")),
              Checkbox(
                value: true,
                onChanged: (b) {},
              ),
            ]),
            new Expanded(
              child: new Column(
                children: [
                  new TextField(
                    maxLines: 1,
                    maxLength: 10,
                  ),
                  new Expanded(
                      child: new ListView(
                    children: _l().map((e) => new Text(e)).toList(),
                  )),
                ],
              ),
            ),
          ],
        ));
  }

  List<String> _l() {
    List<String> l = new List();
    for (var i = 0; i < 100; i++) {
      l.add("name_$i ___ ");
    }
    return l;
  }
}
