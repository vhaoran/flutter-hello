import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImgViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title"),
      ),
      body: new _ctl(),
    );
  }
}

//------------------------------------------------
class _ctl extends StatefulWidget {
  @override
  _ctlState createState() => new _ctlState();
}

class _ctlState extends State<_ctl> {
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: AssetImage("assets/images/a.png"),
      //imageProvider: NetworkImage("assets/images/a.png"),
    );
  }
}
