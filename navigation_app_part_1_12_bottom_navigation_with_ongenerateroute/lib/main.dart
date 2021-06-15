import 'package:flutter/material.dart';
import 'package:navigation_app/home.dart';

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
      onGenerateRoute: (settings) {
        // Handle '/'
        print("came to the root navigator with path : ${settings.name}");
        if(settings.name !=null) {
          return MaterialPageRoute(builder: (context) => Home(path: settings.name!));
        }
      },
    );
  }
}
