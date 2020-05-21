import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DlgErr(BuildContext ctx, String caption, String msg) {
  showDialog(
    context: ctx,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(caption),
        content: ListView(children: [Text(msg)]),
        actions: <Widget>[
          FlatButton(
            child: Text('关闭'),
            onPressed: () {
              print('yes...');
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: Colors.yellowAccent,
        elevation: 10,
        semanticLabel: '',
        // 设置成 圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );
    },
  );
}
