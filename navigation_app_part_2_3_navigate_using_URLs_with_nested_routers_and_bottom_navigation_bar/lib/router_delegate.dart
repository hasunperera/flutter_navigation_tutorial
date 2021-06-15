import 'package:flutter/material.dart';
import 'package:navigation_app/route_path.dart';

import 'home/home.dart';

class MyAppRouterDelegate extends RouterDelegate<MyAppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyAppRoutePath> {
  MyAppRoutePath appPath = MyAppRoutePath("/page1", null);
  final GlobalKey<NavigatorState> navigatorKey;

  MyAppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    appPath.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('Home'),
          child: Home(homeRoutePath: appPath),
        ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        notifyListeners();
        return true;
      },
    );
  }

  MyAppRoutePath get currentConfiguration {
    return appPath;
  }

  @override
  Future<void> setNewRoutePath(MyAppRoutePath path) async {
    appPath.path = path.path;
    appPath.data = path.data;
  }

}