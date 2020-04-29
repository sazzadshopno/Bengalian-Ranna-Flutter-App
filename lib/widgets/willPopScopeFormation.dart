import 'package:flutter/material.dart';

class Formatter extends StatefulWidget {
  Formatter({Key key, this.myScaffold}) : super(key: key);

  final Scaffold myScaffold;

  @override
  _FormatterState createState() => _FormatterState();
}

class _FormatterState extends State<Formatter> {
  Future<bool> _onBackPressed() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Do you want to exit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("No"),
                onPressed: () => Navigator.pop(context, false),
              ),
              FlatButton(
                child: Text("Yes"),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: widget.myScaffold,
    );
  }
}
