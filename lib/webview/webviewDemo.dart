import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  @override
  WebViewDemoState createState() => new WebViewDemoState();
}

class WebViewDemoState extends State<WebViewDemo> {
  String _url = "http://qq.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(
        "hello",
      )),
      body: new WebView(
        initialUrl: 'https://qq.com',
      ),
    );
  }
}
