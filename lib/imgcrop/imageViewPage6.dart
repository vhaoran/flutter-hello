import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/imgcrop/imageViewPage5.dart';

class ImageCrop2 extends StatefulWidget {
  @override
  ImageCrop2State createState() => new ImageCrop2State();
}

class ImageCrop2State extends State<ImageCrop2> {
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(
        "demo crop image ",
      )),
      body: new Column(children: [
        _image(),
        RaisedButton(
          onPressed: () {
            getCropedFile(context, onGetFile: (f) {
              if (f != null) {
                this.file = f;
                setState(() {});
              }
            });
          },
          child: new Text("select"),
        ),
      ]),
    );
  }

  Widget _image() {
    if (this.file != null) {
      return new Container(
        child: new Image.file(this.file),
        height: 200,
      );
    }
    return new Container(height: 0);
  }
}
