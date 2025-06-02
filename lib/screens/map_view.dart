import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_mobile_app/widgets/map.dart';
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

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
  late OverpassApi overpassApi;
  final MapController mapController = MapController();
  List<POI> pois = [];
  LatLng currentPos = LatLng(51.24, -0.57);
  // call api for POI's

  Future<void> loadPOIs(LatLng position, {double area = 0.02}) async {
    try {
      List<POI> response = await overpassApi.getPOIsByArea(
        position: position,
        area: area,
      );
      setState(() {
        pois = response;
      });
    } catch (e) {
      throw Exception("hello");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    overpassApi = Provider.of<OverpassApi>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MyMap(controller: mapController, coord: currentPos, pois: pois),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            height: 55,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                spacing: 6,
                children: [
                  Icon(Icons.search),

                  SizedBox(
                    height: 25,
                    child: VerticalDivider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Where are you going?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("tapped bookmark Icon, map_view screen"),
                    child: Icon(Icons.bookmark),
                  ),
                ],
              ),
            ),
          ),
          // Container()
        ],
      ),

      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => loadPOIs(mapController.camera.center, area: 0.1),
        child: const Icon(Icons.wifi_tethering),
      ),
    );
  }
}
