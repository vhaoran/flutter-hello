import 'package:flutter/material.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'person_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text('分类')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text('购物车')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('我的')
    )
  ];

  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    PersonPage()
  ];

  int currentIndex = 0;

  var currentPage;

  void initState(){
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index){
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[index];
            });
          },
        )
    );
  }
}
