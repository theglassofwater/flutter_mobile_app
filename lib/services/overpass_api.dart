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
        final List<Map<String, dynamic>> elements = processingElements(
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
                name: i["name"],
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

  Future<POI> getPOIbyID({required int id, String type = "node"}) async {
    final query = '[out:json];$type(id:$id);out body;';

    try {
      final response = await http.get(Uri.parse('${url}?data=$query'));

      if (response.statusCode == 200) {
        return processingResponseBody(response.body);
      } else {
        throw Exception("get by ID Status Code : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("get by ID failed...");
    }
  }

  Future<POI> getPOIbyPosition({
    // bs function
    required LatLng position,
    String type = "node",
  }) async {
    final query = '''      [out:json];
      (
        node(around:1,51.20,0.61)[~"."~"."];
        way(around:1,51.20,0.61)[~"."~"."];
        relation(around:1,51.20,0.61)[~"."~"."];
      );
      out geom;''';

    try {
      final response = await http.get(Uri.parse('${url}?data=$query'));

      if (response.statusCode == 200) {
        return processingResponseBody(response.body);
      } else {
        throw Exception("get by ID Status Code : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("get by ID failed...");
    }
  }
}

List<Map<String, dynamic>> processingElements(dynamic data) {
  List<Map<String, dynamic>> output = [];
  for (var i in data) {
    if (i is Map<String, dynamic>) {
      output.add(i);
    }
  }
  return output;
}

POI processingResponseBody(String body) {
  final Map<String, dynamic> data = json.decode(body);
  final List<Map<String, dynamic>> elements = processingElements(
    data["elements"],
  );
  POI output = POI(
    id: elements[0]["id"],
    lat: elements[0]["lat"],
    lon: elements[0]["lon"],
    name: elements[0]["name"],
    type: elements[0]["type"],
    tags: elements[0]["tags"],
  );
  return output;
}
