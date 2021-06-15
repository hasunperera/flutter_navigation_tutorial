import 'package:flutter/material.dart';
import 'package:navigation_app/arguments.dart';

class Page1 extends StatefulWidget {

  Page1({Key? key,}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Page 1"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page 1',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/page2/443', arguments: ScreenArguments("Hello world"));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));
        },
        tooltip: 'Go to Page 2',
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
