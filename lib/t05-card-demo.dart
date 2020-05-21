import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDemoPage extends StatelessWidget {
  final l = {"aaaaa", "bbbb", "cccc"};

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            new Card(
              color: Colors.white70,
              //z轴的高度，设置card的阴影
              elevation: 10.0,
              //设置shape，这里设置成了R角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: new ListTile(
                title: new Text('标题',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle: new Text('子标题'),
                leading: new Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
            ),
            new Card(
              color: Colors.white70,
              //z轴的高度，设置card的阴影
              elevation: 20.0,
              //设置shape，这里设置成了R角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: new ListTile(
                title: new Text('标题',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle: new Text('子标题'),
                leading: new Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
            ),
            new Card(
              color: Colors.white70,
              //z轴的高度，设置card的阴影
              elevation: 20.0,
              //设置shape，这里设置成了R角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: new ListTile(
                title: new Text('标题',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle: new Text('子标题'),
                leading: new Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
            ),
            new Card(
              color: Colors.white70,
              //z轴的高度，设置card的阴影
              elevation: 20.0,
              //设置shape，这里设置成了R角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: new ListTile(
                title: new Text('标题',
                    style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle: new Text('子标题'),
                leading: new Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
            ),
            new Card(
              color: Colors.white70,
              //z轴的高度，设置card的阴影
              elevation: 20.0,
              //设置shape，这里设置成了R角
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
              clipBehavior: Clip.antiAlias,
              semanticContainer: false,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("李四", style: TextStyle(fontSize: 28)),
                    subtitle: Text("CEO"),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("电话:123456789"),
                  ),
                  ListTile(title: Text("地址：xxxxxxxxxxxxxxxxx"))
                ],
              ),
            ),
          ],
        ));
  }
}
