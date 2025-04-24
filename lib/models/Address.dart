import 'package:latlong2/latlong.dart';

class Address {
  final int place_id;
  final int osm_id;
  final String osm_type;
  final double lon;
  final double lat;
  final List<String> name;
  final String type;
  final Map<String, dynamic> address; // Map<String, dynamic>
  final List<double> boundingBox;

  Address({
    required int this.place_id,
    required int this.osm_id,
    required String this.osm_type,
    required double this.lat,
    required double this.lon,
    required List<String> this.name,
    required String this.type,
    required Map<String, dynamic> this.address,
    required List<double> this.boundingBox,
  }) {}

  LatLng get position => LatLng(lat, lon);
  String get shortName => name[0].toString() + name[1].toString();
  // String? get address => tags['addr:street'] as String?;
  // String? get phone => tags['phone'] as String?;
  // String? get website => tags['website'] as String?;
  // String? get openingHours => tags['opening_hours'] as String?;

  @override
  String toString() => 'Address($osm_id, $name, $position)';
}
