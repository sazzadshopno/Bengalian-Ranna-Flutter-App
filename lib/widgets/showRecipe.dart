import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'showItems.dart';

class ShowRecipe extends StatefulWidget {
  final myRecipe;
  ShowRecipe({
    Key key,
    @required this.myRecipe,
  }) : super(key: key);

  @override
  _ShowRecipeState createState() => _ShowRecipeState();
}

class _ShowRecipeState extends State<ShowRecipe> {
  bool isFav = false;

  writeValueInSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final key = widget.myRecipe['id'];
    final value = await preferences.get(key);
    if (value != null) {
      await preferences.setBool(key, !value);
    } else {
      await preferences.setBool(key, true);
    }
    setState(() {
      isFav = preferences.getBool(key);
    });
  }

  init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final key = widget.myRecipe['id'];
    final value = preferences.getBool(key);
    setState(() {
      isFav = value ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.myRecipe['title'],
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
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
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return FlatButton(
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                writeValueInSP();
                final snackBar = SnackBar(
                  content: !isFav
                      ? Text('পছন্দের তালিকায় যুক্ত করা হয়েছে।')
                      : Text('পছন্দের তালিকা থেকে মুছে ফেলা হয়েছে।'),
                  duration: Duration(seconds: 1),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            );
          }),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Card(
                child: Image.asset(widget.myRecipe['picture']),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    widget.myRecipe['title'],
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 30,
                      color: Colors.green,
                    ),
                  ),
                  subtitle: Text(
                    widget.myRecipe['description'],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              ShowItems(items: widget.myRecipe['ingredients'], text: 'উপাদান'),
              ShowItems(items: widget.myRecipe['steps'], text: 'ধাপ'),
            ],
          ),
        ),
      ),
    );
  }
}
