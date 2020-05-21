import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("scaffold-demo"),
      ),
      floatingActionButton: new Row(children: [
        Container(
          height: 36.0,
          width: 120,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.lightGreen[500],
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    //            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                  )),
              maxLength: 30,
              maxLines: 1,
              autocorrect: true,
              autofocus: true,
              obscureText: false,
              textAlign: TextAlign.left,
              onChanged: (text) {
                //内容改变的回调
                print('change $text');
              },
              enabled: true, //是否禁用
            ),
          ),
        ),
        RaisedButton(
          child: new Text('Second Page'),
          onPressed: () {
            print("aaa");
          },
        ),
      ]),
      body: new Container(
        padding: EdgeInsets.all(10),
        child: new Text("test widget"),
      ),
    );
  }
}
