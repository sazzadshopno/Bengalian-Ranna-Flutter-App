import 'package:flutter/material.dart';

import '../pages/homePage.dart';
import '../pages/categoryPage.dart';

import '../utils/animation.dart';

class MyDrawer extends StatefulWidget {
  final String currentPage;
  MyDrawer({this.currentPage});
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isSelected(String page) {
    return page == widget.currentPage;
  }

  Card sideCard(String category, IconData icon, materialPageRoute) {
    bool selected = isSelected(category);
    return Card(
      color: selected ? Colors.green : Colors.white,
      elevation: 5,
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              materialPageRoute, (Route<dynamic> route) => false);
        },
        leading: Icon(
          icon,
          color: selected ? Colors.white : Colors.green,
        ),
        title: Text(
          category,
          style: TextStyle(
            color: selected ? Colors.white : Colors.green,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .60,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('images/banglalian_ranna.png'),
            ),
            sideCard(
              'রান্না সমূহ',
              Icons.home,
              EnterExitRoute(
                exitPage: null,
                enterPage: MyHomePage(),
              ),
            ),
            sideCard(
              'রান্নার শ্রেণী-বিভাগ',
              Icons.category,
              EnterExitRoute(
                exitPage: null,
                enterPage: CategoryPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
