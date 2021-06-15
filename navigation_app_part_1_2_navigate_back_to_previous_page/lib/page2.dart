import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key,}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Page 2"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page 2',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Go back to page 1',
        child: Icon(Icons.navigate_before),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
