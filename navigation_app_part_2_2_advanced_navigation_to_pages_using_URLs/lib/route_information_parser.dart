import 'package:flutter/material.dart';
import 'package:navigation_app/route_path.dart';

class MyAppRouteInformationParser extends RouteInformationParser<MyAppRoutePath> {
  @override
  Future<MyAppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return MyAppRoutePath();
    }

    if (uri.pathSegments.length == 2) {
      return MyAppRoutePath(path: uri.pathSegments[0], data: uri.pathSegments[1]);
    }

    // Handle unknown routes
    return MyAppRoutePath();
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