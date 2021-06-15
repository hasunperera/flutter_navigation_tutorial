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
            ElevatedButton(onPressed: () {
              showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (BuildContext context)  => Dialog(
                child: Container(
                  width: 200,
                  height: 400,
                ),
              ));
            }, child: Text("Show Dialog")),
            ElevatedButton(onPressed: () {
              showMenu<int>(
                context: context,
                useRootNavigator: true,
                position: RelativeRect.fromLTRB(0, 800, 0, 0),
                items: [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: <Widget>[
                            Text("menu item 1")
                          ],
                        )),
                  PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: <Widget>[
                          Text("menu item 2")
                        ],
                      )),
                  PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: <Widget>[
                          Text("menu item 3")
                        ],
                      )),
              ],
                elevation: 8.0,
              );
            }, child: Text("Show POP Menu")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.navigatorKeys.currentState!.pushReplacement(MaterialPageRoute(
            builder: (context) => Page2(navigatorKeys: widget.navigatorKeys, id: "", value: "",),
          ));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));
        },
        tooltip: 'Go to Page 2',
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
