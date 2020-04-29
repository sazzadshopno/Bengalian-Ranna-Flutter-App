import 'package:flutter/material.dart';

class TinyInformation extends StatelessWidget {
  const TinyInformation({
    Key key,
    @required this.myRecipes,
    @required this.index,
  }) : super(key: key);

  final myRecipes;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 18,
                ),
                Text(
                  myRecipes[index]["person"],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.timer,
                  color: Colors.green,
                  size: 18,
                ),
                Text(
                  myRecipes[index]["time"],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.category,
                  color: Colors.green,
                  size: 18,
                ),
                Text(
                  myRecipes[index]["category"],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
