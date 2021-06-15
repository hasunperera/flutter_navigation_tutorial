import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  final Function onTap;
  Page1({Key? key, required this.onTap,}) : super(key: key);

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
          widget.onTap();
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));
        },
        tooltip: 'Go to Page 2',
        child: Icon(Icons.navigate_next),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
