import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {

  final String value;

  Page2({Key? key, required this.value,}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Page 2 : ${widget.value}"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page 2: ${widget.value}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, false);
        },
        tooltip: 'Go back to page 1',
        child: Icon(Icons.navigate_before),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
