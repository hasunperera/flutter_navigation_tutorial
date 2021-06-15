import 'package:flutter/material.dart';
import 'package:navigation_app/page1.dart';
import 'package:navigation_app/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Page1(),
        '/page2': (context) => Page2(),
      },
    );
  }
}
