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
      nwr["public_transport"="station"](${position.latitude - area}, ${position.longitude - area}, ${position.latitude + area}, ${position.longitude + area});
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
        List<POI> output = [];
        for (var i in elements) {
          if (i["lat"].runtimeType == double) {
            output.add(
              POI(
                id: i["id"],
                lat: i["lat"],
                lon: i["lon"],
                name: "hello",
                type: i["type"],
                tags: i["tags"],
              ),
            );
          }
        }
        return output;
      } else {
        throw Exception("Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("In OverpassAPI class");
    }
  }

  List<Map<String, dynamic>> processingResponse(dynamic data) {
    List<Map<String, dynamic>> output = [];
    for (var i in data) {
      if (i is Map<String, dynamic>) {
        output.add(i);
      }
    }
    return output;
  }
}
