import 'package:flutter/material.dart';
import 'package:navigation_app/route_information_parser.dart';
import 'package:navigation_app/router_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  MyAppRouterDelegate _routerDelegate = MyAppRouterDelegate();
  MyAppRouteInformationParser _routeInformationParser = MyAppRouteInformationParser();


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
