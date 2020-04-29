import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './photoDisplayWithTitle.dart';
import './showRecipe.dart';
import './tinyInformation.dart';

class PreviewRecipe extends StatefulWidget {
  PreviewRecipe({Key key, @required this.myRecipes, this.page})
      : super(key: key);

  final myRecipes, page;

  @override
  _PreviewRecipeState createState() => _PreviewRecipeState();
}

class _PreviewRecipeState extends State<PreviewRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.page == 'category'
          ? AppBar(
              title:  (widget.myRecipes != null) && (widget.myRecipes.length > 0)
                  ? Center(
                      child: Text(
                        widget.myRecipes[0]['category'] + ' শ্রেনীর রান্না',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )
                  : null,
              leading: FlatButton(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          : null,
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.myRecipes?.length ?? 0,
          itemBuilder: (BuildContext _, int index) {
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ShowRecipe(
                        myRecipe: widget.myRecipes[index],
                      ),
                    ),
                  );
                },
                title: PhotoDisplayWithTitle(
                  myRecipes: widget.myRecipes,
                  index: index,
                ),
                subtitle:
                    TinyInformation(myRecipes: widget.myRecipes, index: index),
              ),
            );
          },
        ),
      ),
    );
  }
}
