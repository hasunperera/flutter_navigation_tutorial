import 'package:flutter/material.dart';

class MyAppRoutePath extends ChangeNotifier {
  String _path;

  set path(String value) {
    _path = value;
    notifyListeners();
  }

  String get path => _path;
  String? _data;

  String? get data => _data;

  set data(String? value) {
    _data = value;
    notifyListeners();
  }

  MyAppRoutePath(this._path, this._data,);
}