import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayOutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            new Padding(
                padding: new EdgeInsets.all(20.0),
                child: TextField(
                  //controller: controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45.0),
                        //            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                      )),
                  textAlign: TextAlign.left,
                  enabled: true, //是否禁用
                )),
            new Align(
                alignment: Alignment.centerLeft,
//                widthFactor: 1.0,
//                heightFactor: 1.0,
                child: Text("abcdefg")),
            new Center(child: Text("abcdefg")),
          ],
        ));
  }
}
