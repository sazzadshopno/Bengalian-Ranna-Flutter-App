import 'dart:convert';

import 'package:flutter/material.dart';

import '../widgets/willPopScopeFormation.dart';
import '../widgets/myDrawer.dart';
import '../widgets/previewRecipe.dart';
import './splashScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Formatter(
      myScaffold: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'রান্না সমূহ',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        drawer: MyDrawer(
          currentPage: 'রান্না সমূহ',
        ),
        body: SafeArea(
          child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/recipes.json'),
              builder: (_, snapshot) {
                final myRecipes = jsonDecode(snapshot.data.toString());
                return PreviewRecipe(myRecipes: myRecipes);
              },
            ),
          ),
        ),
      ),
    );
  }
}
