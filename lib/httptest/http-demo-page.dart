import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';

class HttpDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title"),
      ),
      body: new _httpFetch(),
    );
  }
}

class _httpFetch extends StatefulWidget {
  @override
  _httpFetchState createState() => new _httpFetchState();
}

class UserInfo {
  int id;
  String nick;
  String userCode;

  UserInfo();

  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nick = json['nick'],
        userCode = json['user_code'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'nick': nick, 'user_code': userCode};

}

class _httpFetchState extends State<_httpFetch> {
  void _visit() {
    setState(() {
      get();
    });
  }

  get() async {
    Dio dio = new Dio();
    Response response = await dio.get("https://baidu.com/");
    print(response.data);
    text = response.data.toString();
  }

  void _visitUserInfo() {
    setUserInfo();
  }

  String text = "";
  String host = '0755yicai.com';

  setUserInfo() async {
    var url = 'http://$host/user/GetUserPublic';
    Dio dio = new Dio();
    Response response = await dio.post(
      url,
      data: {"uid": 1},
      options: Options(headers: {'jwt': 'test/1'}),
    );
    setState(() {
      print(response.data.toString());
      var x = jsonDecode(response.data);
      var m = x['data'];
      print("//------------------------m------------------------");
      print('m = $m');
      //  var u = new UserInfo();
      var u = UserInfo.fromJson(m);

//      u.id = m["id"];
//      u.nick = m["nick"];
//      u.userCode = m["user_code"];
      print("//------------------------------------------------");
      print(u.nick);
      //print(u.toString());
      print(jsonEncode(u));
      print(json.encode(u.toJson()));
      //text = jsonEncode(u);
      text = json.encode(u.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new RaisedButton(
          onPressed: _visit,
          child: new Text("baidu.com"),
        ),
        new RaisedButton(
          onPressed: _visitUserInfo,
          child: new Text("get_user_info_post"),
        ),
        new Text(text),
      ],
    );
  }
}
