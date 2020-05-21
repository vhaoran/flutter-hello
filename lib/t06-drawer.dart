import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DrawerDemo(),
      extendBody: true,
    );
  }
}

class DrawerDemo extends StatefulWidget {
  @override
  _DrawerDemoState createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar, drawer: _drawer, body: new Text("demo drawer body"));
  }

  get _appbar => AppBar(
        title: Text('Drawer Test'),
      );

  get _drawer => ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
            child: Center(
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: CircleAvatar(
                  child: Text('R'),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            onTap: () {
              print("aaaa");
            },
          )
        ],
      );
}
