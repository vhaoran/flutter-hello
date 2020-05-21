import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 't09-secondPage.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(children: [
      RaisedButton(
        child: new Text('Second Page'),
        onPressed: () {
          print('click-OK');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
      ),
      new Divider(
        color: Colors.red,
        height: 20.0,
      ),
      ListTile(
        title: Text('中国程序员', style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('待遇:人傻钱多死得早'),
        leading: new Icon(Icons.account_box, color: Colors.redAccent),
      ),
      new Divider(
        color: Colors.red,
        height: 20.0,
      ),
      new Divider(
        color: Colors.red,
        height: 20.0,
      ),
      Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
      new Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title:
                  Text('中国程序员', style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text('待遇:人傻钱多死得早'),
              leading: new Icon(Icons.account_box, color: Colors.redAccent),
            ),
            new Divider(
              color: Colors.red,
              height: 20.0,
            ),
            ListTile(
              title:
                  Text('日本程序员', style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text('待遇:一群死宅'),
              leading: new Icon(Icons.account_box, color: Colors.redAccent),
            ),
            new Divider(
              color: Colors.red,
              height: 20.0,
            ),
            ListTile(
              title:
                  Text('美国程序员', style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text('待遇:技术宅改变世界'),
              leading: new Icon(Icons.account_box, color: Colors.redAccent),
            ),
          ],
        ),
      ),
      RaisedButton(
        child: Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return new Container(
                height: 300.0,
                child: Icon(
                  Icons.accessibility,
                  size: 200,
                ),
              );
            },
          ).then((val) {
            print(val);
          });
        },
      ),
      RaisedButton(
        child: Text('showDatePicker'),
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: new DateTime.now(),
            firstDate:
                new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
            lastDate: new DateTime.now().add(new Duration(days: 30)), // 加 30 天
          ).then((DateTime val) {
            print(val); // 2018-07-12 00:00:00.000
          }).catchError((err) {
            print(err);
          });
        },
      ),
      FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    ]);
  }
}
