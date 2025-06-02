import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider extends ChangeNotifier {
  POI? home;
  POI? work;

  final SharedPreferences prefs;
  final OverpassApi overpassApi;

  static const _homeIdKey = "home_id";
  static const _homeLatKey = "home_lat";
  static const _homeLonKey = "home_lon";

  static const _workIdKey = "work_id";
  static const _workLatKey = "work_lat";
  static const _workLonKey = "work_lon";

  LocationProvider(this.prefs, this.overpassApi) {}

  Future<void> init() async {
    final homeId = prefs.getInt(_homeIdKey);
    if (homeId != null) {
      home = await overpassApi.getPOIbyID(id: homeId);
    }

    final workId = prefs.getInt(_workIdKey);
    if (workId != null) {
      work = await overpassApi.getPOIbyID(id: workId);
    }
    notifyListeners();
  }

  POI? getHome() {
    return home;
  }

  POI? getWork() {
    return work;
  }

  Future<void> setHome(POI poi) async {
    home = poi;
    await prefs.setInt(_homeIdKey, poi.id);
    await prefs.setDouble(_homeLatKey, poi.position.latitude);
    await prefs.setDouble(_homeLonKey, poi.position.longitude);
    notifyListeners();
  }

  Future<void> setWork(POI poi) async {
    work = poi;
    await prefs.setInt(_workIdKey, poi.id);
    await prefs.setDouble(_workLatKey, poi.position.latitude);
    await prefs.setDouble(_workLonKey, poi.position.longitude);
    notifyListeners();
  }

  Future<void> resetHome() async {
    home = null;
    await prefs.remove(_homeIdKey);
    await prefs.remove(_homeLatKey);
    await prefs.remove(_homeLonKey);
    notifyListeners();
  }

  Future<void> resetWork() async {
    work = null;
    await prefs.remove(_workIdKey);
    await prefs.remove(_workLatKey);
    await prefs.remove(_workLonKey);
    notifyListeners();
  }
}
