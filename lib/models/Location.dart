import 'package:flutter_mobile_app/models/Address.dart';
import 'package:flutter_mobile_app/models/POI.dart';

class Location {
  POI? station;
  Address? address;

  // Location(POI this.station, dynamic this.address) {}

  @override
  String toString() {
    return "Location($address, $station)";
  }
}
