import 'package:flutter/material.dart';

class ShowItems extends StatelessWidget {
  const ShowItems({
    Key key,
    @required this.items,
    @required this.text,
  }) : super(key: key);

  final items, text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 30,
            color: Colors.green,
          ),
        ),
        subtitle: Text(
          '•\t' + items.join('\n•\t'),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}