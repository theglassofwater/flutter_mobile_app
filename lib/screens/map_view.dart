import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MapViewPage(title: 'MapView');
  }
}

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key, required this.title});
  final String title;

  @override
  State<MapViewPage> createState() => _MapViewState();
}

class _MapViewState extends State<MapViewPage> {
  final OverpassApi _overpassApi = OverpassApi();
  final MapController _mapController = MapController();
  List<POI> _pois = [];
  // call api for POI's

  Future<void> loadPOIs(LatLng position, {double area = 0.02}) async {
    try {
      List<POI> response = await _overpassApi.getPOIsBox(
        position: position,
        area: area,
      );
      setState(() {
        _pois = response;
      });
    } catch (e) {
      throw Exception("hello");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      body: SafeArea(
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(initialCenter: LatLng(51.24, -0.57)),
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
                  _pois.map((poi) {
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
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => loadPOIs(_mapController.camera.center, area: 0.1),
        child: const Icon(Icons.wifi_tethering),
      ),
    );
  }
}
