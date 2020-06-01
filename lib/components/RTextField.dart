import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RTextField extends StatelessWidget {
  RTextField({this.onChanged, this.height = 40});

  final ValueChanged<String> onChanged;
  final double height;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Container(
            height: this.height,
            child: new TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
              textAlign: TextAlign.left,
              enabled: true, //是否禁用

              onChanged: this.onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
