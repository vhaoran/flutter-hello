import 'package:crop/crop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class CropImgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text("return")),
          ],
        ));
  }
}
