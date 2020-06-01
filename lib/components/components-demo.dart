import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RButton.dart';
import 'RTextField.dart';

class ComDemo extends StatefulWidget {
  @override
  ComDemoState createState() => new ComDemoState();
}

class ComDemoState extends State<ComDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(
        "hello",
      )),
      body: new Column(children: [
        new Padding(
            padding: EdgeInsets.all(10),
            child: RTextField(
              height: 80,
            )),
        new RRaisedButton(
          child: new Text("abc"),
          onPressed: () {},
        ),
        Row(
          children: [
            Expanded(
                child: SizedBox(
                    height: 50,
                    child: new RRaisedButton(
                      clipBehavior: Clip.hardEdge,
                      child: new Text("abc"),
                      onPressed: () {},
                    )))
          ],
        ),
        new Row(children: [
          new RRaisedButton(
            child: new Text("ok"),
            onPressed: () {},
          ),
          new RRaisedButton(
            child: new Text("cancel"),
            onPressed: () {},
          ),
        ]),
      ]),
    );
  }
}
