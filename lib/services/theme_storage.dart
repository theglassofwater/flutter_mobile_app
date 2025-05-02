import "package:shared_preferences/shared_preferences.dart";

class ThemeStorage {
  static const _themeKey = "theme";

  Future<void> setTheme(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    if (mode == "dark") {
      await prefs.setString(_themeKey, mode);
      return;
    }
    await prefs.setString(_themeKey, "light");
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(_themeKey);

    if (theme == "dark") {
      await prefs.setString(_themeKey, "light");
      return;
    }
    await prefs.setString(_themeKey, "dark");
  }

  Future<String> getTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final theme = prefs.getString(_themeKey);
    if (theme == "dark") {
      return "dark";
    }
    return "light";
  }

  Future<bool> isDark() async {
    final prefs = await SharedPreferences.getInstance();

    final mode = prefs.getString(_themeKey);
    if (mode == "dark") {
      return true;
    }
    return false;
  }

  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, "light");
  }
}
