import 'package:flutter/material.dart';

const snackbar1 = SnackBar(
  content: Text('Hello!'),
);

final snackbar2 = SnackBar(
  content: Row(
    children: [
      Icon(Icons.thumb_up),
      SizedBox(width: 20),
      Expanded(
        child: Text('Hello!'),
      ),
    ],
  ),
);

class SnackBarDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Center(
          child: FlatButton(
            child: Text('Show a SnackBar'),
            onPressed: () {
              Scaffold.of(context).showSnackBar(snackbar2);
            },
          ),
        ),
      ),
    );
  }
}
