import 'package:flutter/material.dart';
import 'package:navigation_app/arguments.dart';
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
      onGenerateRoute: (settings) {
        if(settings.name !=null) {
          if (settings.name == '/') {
            return MaterialPageRoute(builder: (context) => Page1(), settings: RouteSettings(name: '/page1'));
          }

          var uri = Uri.parse(settings.name!);
          final args = settings.arguments as ScreenArguments;
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'page2') {
            print(uri.pathSegments.first);
            var id = uri.pathSegments[1];

            return MaterialPageRoute(builder: (context) => Page2(id: id, value: args.value,), settings: RouteSettings(name: '/page2/$id'));
          } else if(uri.pathSegments.first == 'page2') {
            return MaterialPageRoute(builder: (context) => Page2(id: "", value: args.value,), settings: RouteSettings(name: '/page2'));
          }
        }

        return MaterialPageRoute(builder: (context) => UnknownScreen(), settings: RouteSettings(name: '/unknown'));
      },
    );
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
