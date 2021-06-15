import 'package:flutter/material.dart';
import 'package:navigation_app/page1.dart';
import 'package:navigation_app/page2.dart';

class Home extends StatefulWidget {

  Home({Key? key,}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final navigatorKeys = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {

    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(

        child: Stack(children: [
          MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: navigatorKeys,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Page1(navigatorKeys: navigatorKeys,),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            top: _height - 50,
            right: 0.0,
            child: Container(height: 50, color: Colors.red,
              child: Row(children: [
                ElevatedButton(onPressed: () {
                    navigatorKeys.currentState!.pushReplacement(MaterialPageRoute(
                      builder: (context) => Page1(navigatorKeys: navigatorKeys,),
                    ));
                }, child: Text("go to page 1")),
                ElevatedButton(onPressed: () {
                  navigatorKeys.currentState!.pushReplacement(MaterialPageRoute(
                    builder: (context) => Page2(id: "",value: "", navigatorKeys: navigatorKeys,),
                  ));
                }, child: Text("go to page 2")),
              ],),),),
        ],)
      ),// This trailing comma makes auto-formatting nicer for build methods.
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
