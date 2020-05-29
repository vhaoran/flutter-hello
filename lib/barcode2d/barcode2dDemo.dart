import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:ai_barcode/ai_barcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Barcode2DPagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            QrImage(
              data:
                  'This afdadfsafasdfasdfasdfasdfasdfadsfasdfasdfasdfasdfasdfasdfasdfdasfasasdffasfasdfasdfdsfaasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfis a simple QR code',
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            ),
            QrImage(
              data: '12222222341341234',
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            ),
          ],
        ));
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class _ctl extends StatefulWidget {
  @override
  _ctlState createState() => new _ctlState();
}

class _ctlState extends State<_ctl> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: () {},
          child: new Text('Increment'),
        )
      ],
    );
  }
}
