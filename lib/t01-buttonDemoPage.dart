import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          child: new Icon(Icons.accessibility_new),
          elevation: 3.0,
          highlightElevation: 2.0,
          backgroundColor: Colors.red, // 红色
        ),
        body: new Column(
          children: [
            new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text("return")),
            new MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('点我'),
              onPressed: () {
                // ...
              },
            ),
            new RaisedButton(
              child: new Text('点我'),
              onPressed: () {},
            ),
            IconButton(
              icon: new Icon(Icons.volume_up),
              tooltip: 'Increase volume by 10%',
              onPressed: () {
                // ...
              },
            ),
            new DropdownButton(),
            new OutlineButton(
              onPressed: () {},
              child: Text("边线按钮"),
              textColor: Colors.red,
              splashColor: Colors.green,
              highlightColor: Colors.black,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            new ButtonBar(
              children: <Widget>[
                new CloseButton(),
                new BackButton(),
                new BackButtonIcon(),
              ],
            )
          ],
        ));
  }
}
