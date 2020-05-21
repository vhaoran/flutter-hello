import 'package:flutter/material.dart';
import 'package:hello/prefrence_demo/prefrencePage.dart';
import 'package:hello/sqDemo/sqlDemo.dart';
import 'package:hello/t02-state-demo.dart';
import 'package:hello/t03-aligin-padding.dart';
import 'package:hello/t05-card-demo.dart';
import 'package:hello/t06-drawer.dart';
import 'package:hello/t11-scafold-demo.dart';
import 'package:hello/t99-thirdPage.dart';
import 'package:hello/tabtest/index_page.dart';
import 'package:hello/ws/wsDemo.dart';

import 'b-loginPage.dart';
import 'httptest/http-demo-page.dart';
import 'loginDemo/login.dart';
import 'mq/mqView.dart';
import 't01-buttonDemoPage.dart';
import 't04-icon-demo.dart';
import 't09-secondPage.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  bool _login = false;

  Widget _choice() {
    if (_login) {
      return new MyHomePage(title: 'Flutter Demo Home Page');
    }

    return new LoginPageTest();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _choice(),
      //initialRoute: '/',
      routes: {
        'ScaffoldDemo': (BuildContext context) => new ScaffoldDemo(),
        'WsDemoPage': (BuildContext context) => new WsDemoPage(),
        'MqView': (BuildContext context) => new MqView(),
        'SqPage': (BuildContext context) => new SqPage(),
        'StoreDemoPage': (BuildContext context) => new StoreDemoPage(),
        'home': (BuildContext context) => new MyHomePage(),
        'HttpDemoPage': (BuildContext context) => new HttpDemoPage(),
        'IndexPage': (BuildContext context) => new IndexPage(),
        'DrawerDemoPage': (BuildContext context) => new DrawerDemoPage(),
        'CardDemoPage': (BuildContext context) => new CardDemoPage(),
        'LayOutDemoPage': (BuildContext context) => new LayOutDemoPage(),
        'icon-demo': (BuildContext context) => new IconDemoPage(),
        'login-page': (BuildContext context) => new LoginPage(),
        'btn-demo': (context) => new ButtonDemoPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("演示跳转"),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ScaffoldDemo");
                },
                child: new Text("ScaffoldDemo")),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "WsDemoPage");
                },
                child: new Text("WsDemoPage")),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "MqView");
                },
                child: new Text("MqView")),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "SqPage");
                },
                child: new Text("SqPage")),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "StoreDemoPage");
                },
                child: new Text("StoreDemoPage")),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "HttpDemoPage");
                },
                child: new Text("HttpDemoPage")),

            //------------------------------------------------
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "IndexPage");
                },
                child: new Text("IndexPage")),
            //------------------------------------------------
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "DrawerDemoPage");
                },
                child: new Text("DrawerDemoPage")),

            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "CardDemoPage");
                },
                child: new Text("CardDemoPage")),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "LayOutDemoPage");
                },
                child: new Text("LayOutDemoPage")),

            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "login-page");
                },
                child: new Text("login-page")),
            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "btn-demo");
                },
                child: new Text("btn-demo")),

            new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "icon-demo");
                },
                child: new Text("icon-demo")),

            //------------------------------------------------
            new FlatButton(
                onPressed: () {
                  //Navigator.pushNamed<String>(context, "page3");
                  Navigator.push<String>(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new StateDemoPage();
                  }));
                },
                child: new Text("state-demo")),
            new FlatButton(
                onPressed: () {
                  //Navigator.pushNamed<String>(context, "page3");
                  Navigator.push<String>(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new SecondPage();
                  }));
                },
                child: new Text("page2-call")),

            new FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: new Text("page2-call-2")),
            new FlatButton(
                onPressed: () {
                  Navigator.push<String>(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new ThirdPage(title: "请输入昵称");
                  })).then((String result) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            content: new Text("您输入的昵称为:$result"),
                          );
                        });
                  });
                },
                child: new Text("跳转传参并返回值")),
          ],
        ),
      ),
    );
  }
}
