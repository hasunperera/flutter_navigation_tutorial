import 'package:flutter/material.dart';
import 'package:navigation_app/arguments.dart';
import 'package:navigation_app/page1.dart';
import 'package:navigation_app/page2.dart';

class Home extends StatefulWidget {

  final String path;

  Home({Key? key, required this.path,}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final navigatorKeys = GlobalKey<NavigatorState>();
  bool firstTime = true;

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
              onGenerateRoute: (settings) {
                print("came to the inner navigator with path : ${settings.name}");
                if(settings.name !=null) {
                  String routePath = "/";

                  if(firstTime) {
                    routePath = widget.path;
                    firstTime = false;
                  } else {
                    routePath = settings.name!;
                  }

                  if (routePath == '/') {
                    return MaterialPageRoute(builder: (context) => Page1(), settings: RouteSettings(name: '/page1'));
                  }
                  var args;
                  if(settings.arguments != null) {
                    args = settings.arguments as ScreenArguments;
                  }


                  var uri = Uri.parse(routePath);
                  if (uri.pathSegments.length == 2 &&
                      uri.pathSegments.first == 'page2') {
                    var id = uri.pathSegments[1];

                    return MaterialPageRoute(builder: (context) => Page2(id: id, value: args != null ? args.value : "null",), settings: RouteSettings(name: '/page2/$id'));
                  } else if(uri.pathSegments.first == 'page2') {
                    return MaterialPageRoute(builder: (context) => Page2(id: "null", value: args != null ? args.value : "null",), settings: RouteSettings(name: '/page2'));
                  }
                }

                return MaterialPageRoute(builder: (context) => UnknownScreen());
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              top: _height - 50,
              right: 0.0,
              child: Container(height: 50, color: Colors.red,
                child: Row(children: [
                  ElevatedButton(onPressed: () {
                    navigatorKeys.currentState!.pushReplacementNamed("/");
                  }, child: Text("go to page 1")),
                  ElevatedButton(onPressed: () {
                    navigatorKeys.currentState!.pushReplacementNamed("/page2/999", arguments: ScreenArguments("Hello world"));
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
