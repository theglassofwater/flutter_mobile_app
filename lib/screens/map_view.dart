import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),

      body: SafeArea(
        child: FlutterMap(
          options: MapOptions(initialCenter: LatLng(51.24, -0.57)),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'com.example.app',
              additionalOptions: const {
                'attribution': '© OpenStreetMap contributors',
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => (),
        child: const Icon(Icons.add),
      ),
    );
  }
}
