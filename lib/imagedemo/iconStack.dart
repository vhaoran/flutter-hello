import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSizePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new SizedBox(
            width: 100,
            height: 100,
            child: new Stack(
              fit: StackFit.expand,
              children: [
                new Icon(
                  Icons.cancel,
                  semanticLabel: "weihaoran",
                  size: 100,
                ),
                new Align(
                  alignment: Alignment.bottomRight,
                  child: new Icon(
                    Icons.add_box,
                    color: Colors.red,
                    semanticLabel: "weihaoran",
                    size: 32,
                  ),
                ),
                new Align(
                    alignment: Alignment.topLeft,
                    child: new Icon(
                      Icons.people,
                      color: Colors.blue,
                      size: 16,
                      semanticLabel: "weihaoran",
                      textDirection: TextDirection.rtl,
                    )),
              ],
            )));
  }
}
