import 'package:flutter/material.dart';
import 'package:navigation_app/page1.dart';
import 'package:navigation_app/page2.dart';
import 'package:navigation_app/route_path.dart';

class MyAppRouterDelegate extends RouterDelegate<MyAppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyAppRoutePath> {
  MyAppRoutePath appPath = MyAppRoutePath();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('Page1'),
          child: Page1(onTap: goToNextPage,),
        ),
        if(appPath.path == "page2") MaterialPage(
          key: ValueKey('Page2'),
          child: Page2(value: appPath.data!,id: '',),
        )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        appPath = MyAppRoutePath(path: "page1");
        notifyListeners();

        return true;
      },
    );
  }

  goToNextPage() {
    appPath = MyAppRoutePath(path: "page2", data: "999");
    notifyListeners();
  }

  MyAppRoutePath get currentConfiguration {
    return appPath;
  }

  @override
  Future<void> setNewRoutePath(MyAppRoutePath path) async {
    appPath = path;
  }


}