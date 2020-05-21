
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  final String title;

  ThirdPage({this.title});

  @override
  State<StatefulWidget> createState() {
    return new _ThirdPageState();
  }
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController controller;

  @override
  void initState() {
    controller = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(labelText: "请输入昵称"),
            controller: controller,
          ),
          new RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                if (controller.text == '') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("请输入昵称"),
                      ));
                  return;
                }
                Navigator.pop(context, controller.text);
              },
              child: new Text("OK"))
        ],
      ),
    );
  }
}
