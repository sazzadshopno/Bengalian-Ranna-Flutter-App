import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/willPopScopeFormation.dart';
import '../widgets/myDrawer.dart';
import '../widgets/previewRecipe.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Formatter(
      myScaffold: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'রান্নার শ্রেণী-বিভাগ',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        drawer: MyDrawer(
          currentPage: 'রান্নার শ্রেণী-বিভাগ',
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/recipes.json'),
            builder: (_, snapshot) {
              final myRecipes = jsonDecode(snapshot.data.toString());
              var recipeCategory = [],
                  images = [],
                  length = myRecipes?.length ?? 0;
              for (int i = 0; i < length; i++) {
                recipeCategory.add(myRecipes[i]['category']);
              }
              recipeCategory = recipeCategory.toSet().toList();
              for (int i = 0; i < recipeCategory?.length ?? 0; i++) {
                for (int j = 0; j < length; j++) {
                  if (recipeCategory[i] == myRecipes[j]['category']) {
                    images.add(myRecipes[j]['picture']);
                    break;
                  }
                }
              }
              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: .9,
                children: List.generate(recipeCategory?.length ?? 0, (index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Card(
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Colors.white.withOpacity(.1),
                        child: ListTile(
                          onTap: () {
                            var selectedRecipes = [];
                            for (int i = 0; i < myRecipes?.length ?? 0; i++) {
                              if (myRecipes[i]['category'] ==
                                  recipeCategory[index]) {
                                selectedRecipes.add(myRecipes[i]);
                              }
                            }
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => PreviewRecipe(
                                  myRecipes: selectedRecipes,
                                  page: 'category',
                                ),
                              ),
                            );
                          },
                          title: Center(
                            child: Text(
                              recipeCategory[index],
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
