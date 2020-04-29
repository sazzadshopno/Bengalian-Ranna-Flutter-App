import 'package:flutter/material.dart';
import './pages/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'বাঙালীয়ান রান্না',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Shorif Jonota',
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
