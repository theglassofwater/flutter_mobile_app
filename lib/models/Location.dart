import 'package:flutter_mobile_app/models/Address.dart';
import 'package:flutter_mobile_app/models/POI.dart';

class Location {
  POI? station;
  Address? address;

  // Location(POI this.station, dynamic this.address) {}
  // Location({this.station, this.address})
  //   : assert(
  //       station != null || address != null,
  //       'Location must have at least a station or an address',
  //     );

  @override
  String toString() {
    return "Location($address, $station)";
  }
}
