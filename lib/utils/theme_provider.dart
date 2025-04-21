import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/styles/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppTheme.darkTheme) {
      _themeData = AppTheme.lightTheme;
    } else {
      _themeData = AppTheme.darkTheme;
    }
    notifyListeners();
  }
}
