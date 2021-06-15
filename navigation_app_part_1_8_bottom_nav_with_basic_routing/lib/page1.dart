import 'package:flutter/material.dart';
import 'package:navigation_app/page2.dart';

class Page1 extends StatefulWidget {

  final GlobalKey<NavigatorState> navigatorKeys;

  Page1({Key? key, required this.navigatorKeys,}) : super(key: key);

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
          // widget.navigatorKeys.currentState!.push(MaterialPageRoute(
          //   builder: (context) => Page2(navigatorKeys: widget.navigatorKeys, id: "", value: "",),
          // ));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2(navigatorKeys: widget.navigatorKeys, id: "", value: "",)));
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => Page2(navigatorKeys: widget.navigatorKeys, id: "", value: "",)));
        },
        tooltip: 'Go to Page 2',
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
