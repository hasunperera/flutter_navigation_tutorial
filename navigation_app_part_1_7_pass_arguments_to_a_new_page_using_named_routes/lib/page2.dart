import 'package:flutter/material.dart';
import 'package:navigation_app/arguments.dart';

class Page2 extends StatefulWidget {

  Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {


  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page 2 : ${args.value}"),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Page 2: ${args.value}',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          tooltip: 'Go back to page 1',
          child: Icon(Icons.navigate_before),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
