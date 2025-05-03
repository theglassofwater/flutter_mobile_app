import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:latlong2/latlong.dart';

class MyMap extends StatelessWidget {
  final MapController controller;
  final LatLng coord;
  final List<POI> pois;

  const MyMap({
    required this.controller,
    required this.coord,
    required this.pois,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(initialCenter: coord),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'com.example.app',
          additionalOptions: const {
            'attribution': '© OpenStreetMap contributors',
          },
        ),
        MarkerLayer(
          markers:
              pois.map((poi) {
                return Marker(
                  point: poi.position,
                  child: GestureDetector(
                    child: Icon(Icons.train_sharp),
                    onTap: () => print(poi),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
