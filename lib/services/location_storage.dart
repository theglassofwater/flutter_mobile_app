import "package:shared_preferences/shared_preferences.dart";

class LocationStorage {
  static const _homeIdKey = "home_id";
  static const _homeLatKey = "home_lat";
  static const _homeLonKey = "home_lon";

  static const _workIdKey = "work_id";
  static const _workLatKey = "work_lat";
  static const _workLonKey = "work_lon";

  final SharedPreferences prefs;

  LocationStorage(this.prefs);

  Future<void> setHome(int id, double lat, double lon) async {
    // final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_homeIdKey, id);
    await prefs.setDouble(_homeLatKey, lat);
    await prefs.setDouble(_homeLonKey, lon);
  }

  Future<void> setWork(int id, double lat, double lon) async {
    // final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_workIdKey, id);
    await prefs.setDouble(_workLatKey, lat);
    await prefs.setDouble(_workLonKey, lon);
  }

  Future<Map<String, dynamic>?> getHome() async {
    // final prefs = await SharedPreferences.getInstance();

    final id = prefs.getInt(_homeIdKey);
    final lat = prefs.getDouble(_homeLatKey);
    final lon = prefs.getDouble(_homeLonKey);

    if (id != null && lat != null && lon != null) {
      return {"id": id, "lat": lat, "lon": lon};
    }
    return null;
  }

  Future<Map<String, dynamic>?> getWork() async {
    // final prefs = await SharedPreferences.getInstance();

    final id = prefs.getInt(_workIdKey);
    final lat = prefs.getDouble(_workLatKey);
    final lon = prefs.getDouble(_workLonKey);

    if (id != null && lat != null && lon != null) {
      return {"id": id, "lat": lat, "lon": lon};
    }
    return null;
  }

  Future<void> resetHome() async {
    // final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_homeIdKey);
    await prefs.remove(_homeLatKey);
    await prefs.remove(_homeLonKey);
  }

  Future<void> resetWork() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_workIdKey);
    await prefs.remove(_workLatKey);
    await prefs.remove(_workLonKey);
  }

  Future<void> resetAll() async {
    // or call resetHome + resetWork, but then sharedPreferences.instances is called twice...
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_workIdKey);
    await prefs.remove(_workLatKey);
    await prefs.remove(_workLonKey);

    await prefs.remove(_homeIdKey);
    await prefs.remove(_homeLatKey);
    await prefs.remove(_homeLonKey);
  }
}
