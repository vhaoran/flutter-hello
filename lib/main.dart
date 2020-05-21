import 'package:flutter/material.dart';
import 'package:hello/prefrence_demo/prefrencePage.dart';
import 'package:hello/refreshindicator/refreshIndicator_demo.dart';
import 'package:hello/snackbars/snackBar2.dart';
import 'package:hello/snackbars/snackbar_demo.dart';
import 'package:hello/sqDemo/sqlDemo.dart';
import 'package:hello/t02-state-demo.dart';
import 'package:hello/t03-aligin-padding.dart';
import 'package:hello/t05-card-demo.dart';
import 'package:hello/t06-drawer.dart';
import 'package:hello/t11-scafold-demo.dart';
import 'package:hello/t99-thirdPage.dart';
import 'package:hello/tab/tab_view/TabViewScreen.dart';
import 'package:hello/tab/tabcontroller/tab_bottom_demo.dart';
import 'package:hello/tab/tabcontroller/tab_controller_demo.dart';
import 'package:hello/tabtest/index_page.dart';
import 'package:hello/text_style/text_style_demo.dart';
import 'package:hello/theme/theme_demo.dart';
import 'package:hello/ws/wsDemo.dart';

import 'animation/animation01.dart';
import 'b-loginPage.dart';
import 'httptest/http-demo-page.dart';
import 'listviews/listviewDemo.dart';
import 'load_more/load_more_demo.dart';
import 'loginDemo/login.dart';
import 'mq/mqView.dart';
import 't01-buttonDemoPage.dart';
import 't04-icon-demo.dart';
import 't09-secondPage.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  bool _login = true;

  Widget _choice() {
    //if (_login) {
    return new MyHomePage(title: 'Flutter Demo Home Page');
    //}

    //return new LoginPageTest();
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
        'WsDemoPage': (BuildContext context) => new WsDemoPage(),
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
        child: new GridView.count(
          crossAxisSpacing: 4.0,
          //垂直子Widget之间间距
          mainAxisSpacing: 4.0,
          //GridView内边距
          padding: EdgeInsets.all(4.0),
          //一行的Widget数量
          crossAxisCount: 2,
          //子Widget宽高比例
          childAspectRatio: 4.0,

          children: <Widget>[
            //whr
            btn("SnackBarDemoPage", new SnackBarDemoPage(), context),
            btn("TabBarDemo", new TabBarDemo(), context),
            btn("BottomTabBarPage", new BottomTabBarPage(), context),
            btn("TabViewScreen", new TabViewScreen(), context),
            btn("TextStylePage", new TextStylePage(), context),
            btn("ThemeDemo", new ThemeDemo(), context),
            btn("RefreshIndicatorDemo", new RefreshIndicatorDemo(), context),
            btn("LoadMorePage", new LoadMorePage(), context),
            btn("Animation01", new Animation01(), context),
            btn("ListViewPage", new ListViewPage(), context),
            btn("SnackBarPage", new SnackBarPage(), context),
            btn("ScaffoldDemo", new ScaffoldDemo(), context),
            btn("WsDemoPage", new WsDemoPage(), context),
            btn("MqView", new MqView(), context),
            btn("SqPage", new SqPage(), context),
            btn("StoreDemoPage", new StoreDemoPage(), context),
            btn("HttpDemoPage", new HttpDemoPage(), context),
            btn("IndexPage", new IndexPage(), context),
            btn("DrawerDemoPage", new DrawerDemoPage(), context),
            btn("CardDemoPage", new CardDemoPage(), context),
            btn("LayOutDemoPage", new LayOutDemoPage(), context),
            btn("LayOutDemoPage", new LayOutDemoPage(), context),
            btn("LayOutDemoPage", new LoginPage(), context),
            btn("LayOutDemoPage", new LoginPage(), context),
            btn("ButtonDemoPage", new ButtonDemoPage(), context),
            btn("IconDemoPage", new IconDemoPage(), context),
            btn("StateDemoPage", new StateDemoPage(), context),
            btn("SecondPage", new SecondPage(), context),
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

RaisedButton btn(String text, Widget page, BuildContext ctx) {
  return new RaisedButton(
      onPressed: () {
        toPage(ctx, page);
      },
      child: new Text(text));
}

toPage(BuildContext ctx, Widget page) {
  Navigator.push<String>(ctx,
      new MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}
