import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/styles/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark;

  final SharedPreferences prefs;
  static const _key = "is_dark";

  ThemeProvider(this.prefs) : isDark = prefs.getBool(_key) ?? false;

  ThemeData get themeData => isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
  String get theme => isDark ? "dark" : "light";

  Future<void> setTheme(String theme) async {
    if (theme == "dark") {
      await prefs.setBool(_key, true);
    } else {
      await prefs.setBool(_key, false);
    }

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    await prefs.setBool(_key, !isDark);
    isDark = !isDark;

    notifyListeners();
  }

  Future<void> reset() async {
    await prefs.setString(_key, "light");
  }
}
