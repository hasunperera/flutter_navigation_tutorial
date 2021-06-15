import 'package:flutter/material.dart';
import 'package:navigation_app/route_path.dart';
import 'home_router_delegate.dart';

class Home extends StatefulWidget {
  final MyAppRoutePath homeRoutePath;

  Home({Key? key, required this.homeRoutePath,}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeRouterDelegate? _routerDelegate;

  void initState() {
    super.initState();
    _routerDelegate = HomeRouterDelegate(widget.homeRoutePath);
  }

  @override
  Widget build(BuildContext context) {


    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Router(
            routerDelegate: _routerDelegate!,
          ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          top: _height - 50,
          right: 0.0,
          child: Container(height: 50, color: Colors.red,
          child: Row(children: [
            ElevatedButton(onPressed: () {
              _routerDelegate!.updatePath("page1", null);
            }, child: Text("go to page 1")),
            ElevatedButton(onPressed: () {
              _routerDelegate!.updatePath("page2", "3222");
            }, child: Text("go to page 2")),
          ],),),),
          ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
