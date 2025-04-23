import 'dart:convert';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class OverpassApi {
  final String url = "https://overpass-api.de/api/interpreter";

  Future<List<POI>> getPOIsBox({
    required LatLng position,
    required double area,
  }) async {
    String query = """
      [out:json][timeout:25];
      nwr["public_transport"="station"](${position.longitude - area}, ${position.latitude - area}, ${position.longitude + area}, ${position.latitude - area});
      out geom;
    """;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {},
        body: {"data": query},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Map<String, dynamic>> elements = processingResponse(
          data["elements"],
        );

        return elements.map((elem) => POI.fromJson(elem)).toList();
      } else {
        throw Exception("Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Try block just failed...");
    }
  }

  List<Map<String, dynamic>> processingResponse(dynamic data) {
    // elements to
    return data.map((element) => element as Map<String, dynamic>).toList();
  }
}
