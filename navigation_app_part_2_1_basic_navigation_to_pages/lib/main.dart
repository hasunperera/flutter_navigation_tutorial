import 'package:flutter/material.dart';
import 'package:navigation_app/arguments.dart';
import 'package:navigation_app/page1.dart';
import 'package:navigation_app/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool goToPage2=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('Page1'),
            child: Page1(onTap: goToNextPage,),
          ),
          if(goToPage2) MaterialPage(
            key: ValueKey('Page2'),
            child: Page2(value: '',id: '',),
          )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            goToPage2 = false;
          });

          return true;
        },
      ),
    );
  }

  goToNextPage() {
    setState(() {
      goToPage2 = true;
    });
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}
