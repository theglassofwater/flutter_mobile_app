import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/services/theme_storage.dart';
import 'package:flutter_mobile_app/styles/themes.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark;
  ThemeProvider(this.isDark);

  // ThemeData _themeData = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;

  ThemeData get themeData => isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  String get theme => isDark ? "dark" : "light";

  set theme(String theme) {
    isDark = theme == "dark" ? true : false;
    ThemeStorage().setTheme(isDark ? "dark" : "light");

    notifyListeners();
  }

  void toggleTheme() async {
    isDark = !isDark;
    ThemeStorage().toggleTheme();

    notifyListeners();
  }

  // void toggleTheme() {
  //   if (_themeData == AppTheme.darkTheme) {
  //     _themeData = AppTheme.lightTheme;
  //   } else {
  //     _themeData = AppTheme.darkTheme;
  //   }
  //   notifyListeners();
  // }
}
