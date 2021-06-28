import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;
  setThem(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
