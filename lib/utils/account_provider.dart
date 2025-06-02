import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider extends ChangeNotifier {
  String? name;
  // String? firstname;
  // String? lastname;
  String? email;
  String? password;
  // int? userId;
  // int? loginToken;

  final SharedPreferences prefs;

  static const _nameKey = "username";
  static const _emailKey = "email";
  static const _passwordKey = "password";

  AccountProvider(this.prefs) {
    name = prefs.getString(_nameKey);
    email = prefs.getString(_emailKey);
    password = prefs.getString(_passwordKey);
  }

  // String? get getName => name;
  String? getName() {
    return name;
  }

  String? getEmail() {
    return email;
  }

  String? getPassword() {
    return password;
  }

  Future<void> setName(String _name) async {
    name = _name;
    await prefs.setString(_nameKey, name!);
    notifyListeners();
  }

  Future<void> setEmail(String _email) async {
    email = _email;
    await prefs.setString(_emailKey, email!);
    notifyListeners();
  }

  Future<void> setPassword(String _password) async {
    password = _password;
    await prefs.setString(_passwordKey, password!);
    notifyListeners();
  }

  Future<void> reset() async {
    name = null;
    email = null;
    password = null;
    await prefs.remove(_nameKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
    notifyListeners();
  }
}
