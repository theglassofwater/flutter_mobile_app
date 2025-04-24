import 'package:latlong2/latlong.dart';

class POI {
  final int id;
  final double lon;
  final double lat;
  String? name;
  final String type;
  final dynamic tags; // Map<String, dynamic>

  POI({
    required int this.id,
    required double this.lat,
    required double this.lon,
    required String? this.name,
    required String this.type,
    required dynamic this.tags,
  }) {
    if (this.name == null && this.tags["name"] != null) {
      this.name = this.tags["name"];
    }
  }

  factory POI.fromJson(Map<String, dynamic> json) {
    final tags = json["tags"] as Map<String, dynamic>? ?? {};

    double lat = json["lat"];
    double lon = json["lon"];

    return POI(
      id: json["id"],
      lat: lat,
      lon: lon,
      name: json["name"],
      type: json["type"],
      tags: tags,
    );
  }

  String get amenityType => tags['amenity'] as String? ?? 'unknown';
  LatLng get position => LatLng(lat, lon);
  String? get address => tags['addr:street'] as String?;
  String? get phone => tags['phone'] as String?;
  String? get website => tags['website'] as String?;
  String? get openingHours => tags['opening_hours'] as String?;

  @override
  String toString() => 'POI($id, $name, $position)';
}
