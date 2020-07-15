import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackDemo1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Stack(
          fit: StackFit.expand,
          children: [
            new FlatButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text("return")),
            new Opacity(
              opacity: 0.4,
              child: new InkWell(
                onTap: () {
                  print("#################*******#####");
                },
                onTapDown: (e) {
                  print("-------------------");
                },
                child: new Expanded(
                  child: new Container(color: Colors.blue),
                ),
              ),
            ),
          ],
        ));
  }
}
