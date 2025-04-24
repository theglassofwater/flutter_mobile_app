import 'dart:convert';
import 'package:flutter_mobile_app/models/Address.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
/*
this is what is in body
Address(
          place_id: int,
          osm_id: int,
          osm_type: String,
          lat: String,               to double
          lon: String,               to double
          name: String,               to List<String>
          type: String,
          address: _Map<String, dynamic>,
          boundingBox: List<dynamic>,         to List<double>
        );

*/

class NominatimApi {
  final String url = "https://nominatim.openstreetmap.org";

  Future<Address> getAddressByPosition({required LatLng position}) async {
    final uri = Uri.parse(
      '${url}/reverse?format=jsonv2&lat=${position.latitude}&lon=${position.longitude}&addressdetails=1',
    );

    try {
      final response = await http.get(
        uri,
        headers: {
          'User-Agent': 'flutter-mobile-app', // Nominatim requires this
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //   print("""
        //   final output = Address(
        //     place_id: ${data["place_id"].runtimeType},
        //     osm_id: ${data["osm_id"].runtimeType},
        //     osm_type: ${data["osm_type"].runtimeType},
        //     lat: ${data["lat"].runtimeType},
        //     lon: ${data["lon"].runtimeType},
        //     name: ${data["display_name"].runtimeType},
        //     type: ${data["type"].runtimeType},
        //     address: ${data["address"].runtimeType},
        //     boundingBox: ${data["boundingbox"].runtimeType},
        //   );
        //   """);
        // List<String> display_name = data["display_name"].split(",");
        //.map((str) => str.trim()).toList();

        final output = Address(
          place_id: data["place_id"],
          osm_id: data["osm_id"],
          osm_type: data["osm_type"],
          lat: double.parse(data["lat"]),
          lon: double.parse(data["lon"]),
          name: data["display_name"].split(","),
          type: data["type"],
          address: data["address"],
          boundingBox:
              data["boundingbox"]
                  .map<double>((pos) => (double.parse(pos)))
                  .toList(),
        );
        return output;
      } else {
        throw Exception("GetAddressByPosition");
      }
    } catch (e) {
      throw Exception("");
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
