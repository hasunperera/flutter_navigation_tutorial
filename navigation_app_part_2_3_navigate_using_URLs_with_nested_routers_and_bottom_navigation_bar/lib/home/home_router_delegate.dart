import 'package:flutter/material.dart';
import 'package:navigation_app/page1.dart';
import 'package:navigation_app/page2.dart';
import 'package:navigation_app/route_path.dart';

class HomeRouterDelegate extends RouterDelegate<MyAppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyAppRoutePath> {
  final MyAppRoutePath appPath;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyAppRoutePath get getAppPath {
    return this.appPath;
  }

  updatePath(String path, String? data) {
    this.appPath.path = path;
    this.appPath.data = data;
  }

  HomeRouterDelegate(this.appPath);

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

        updatePath("page1", null);

        return true;
      },
    );
  }

  goToNextPage() {
    updatePath("page2", "852");
  }

  @override
  Future<void> setNewRoutePath(MyAppRoutePath path) async {
    assert(false);
  }


}