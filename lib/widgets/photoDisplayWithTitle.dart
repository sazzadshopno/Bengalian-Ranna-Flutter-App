import 'package:flutter/material.dart';

class PhotoDisplayWithTitle extends StatelessWidget {
  const PhotoDisplayWithTitle(
      {Key key, @required this.myRecipes, @required this.index})
      : super(key: key);

  final myRecipes;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          child: Image.asset(myRecipes[index]["picture"]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Card(
              margin: EdgeInsets.fromLTRB(10, 125, 0, 0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: Text(
                  myRecipes[index]["title"],
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
