import 'package:flutter/material.dart';
import 'package:navigation_app/route_path.dart';

class MyAppRouteInformationParser extends RouteInformationParser<MyAppRoutePath> {
  @override
  Future<MyAppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.length == 0) {
      return MyAppRoutePath("/page1", null);
    }

    if (uri.pathSegments.length == 2) {
      return MyAppRoutePath(uri.pathSegments[0], uri.pathSegments[1]);
    }

    // handle other routes
    return MyAppRoutePath("/page1", null);
  }

  @override
  RouteInformation restoreRouteInformation(MyAppRoutePath path) {
    if (path.data == null) {
      return RouteInformation(location: path.path);
    } else {
      return RouteInformation(location: path.path+"/${path.data}");
    }
  }
}