import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _code = "";
var _pwd = "";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("title"),
        ),
        body: new Column(
          children: [
            TextField(
              //controller: controller,
              decoration: InputDecoration(
                  icon: new Icon(Icons.person),
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    //            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                  )),
              maxLength: 30,
              //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
              maxLines: 1,
              //最大行数
              autocorrect: true,
              //是否自动更正
              autofocus: true,
              //是否自动对焦
              obscureText: false,
              //是否是密码
              textAlign: TextAlign.left,
              //文本对齐方式
              //style: TextStyle(fontSize: 30.0, color: Colors.blue),//输入文本的样式
              //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
              onChanged: (text) {
                //内容改变的回调
                print('change $text');
                _code = text;
              },
              //              onSubmitted: (text) {//内容提交(按回车)的回调
              //                print('submit $text');
              //              },
              enabled: true, //是否禁用
            ),
            TextField(
              //controller: controller,
              decoration: InputDecoration(
                  icon: new Icon(Icons.keyboard),
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    //            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                  )),
              maxLength: 30,
              //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
              maxLines: 1,
              //最大行数
              autocorrect: true,
              //是否自动更正
              autofocus: true,
              //是否自动对焦
              obscureText: false,
              //是否是密码
              textAlign: TextAlign.left,
              //文本对齐方式
              //style: TextStyle(fontSize: 30.0, color: Colors.blue),//输入文本的样式
              //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
              onChanged: (text) {
                //内容改变的回调
                print('change $text');
                _pwd = text;
              },
              //              onSubmitted: (text) {//内容提交(按回车)的回调
              //                print('submit $text');
              //              },
              enabled: true, //是否禁用
            ),
            new RaisedButton(
                onPressed: () {
                  print("$_code : $_pwd");
                },
                child: new Text("登录")),
          ],
        ));
  }
}
