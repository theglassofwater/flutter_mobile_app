import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:flutter_mobile_app/widgets/button.dart';
import 'package:flutter_mobile_app/widgets/map.dart';
import 'package:flutter_mobile_app/widgets/topBar.dart';
import 'package:latlong2/latlong.dart';

class LocationSelection extends StatefulWidget {
  final PageController controller;
  final MapController mapController;
  final void Function(int step) setStep;
  final Function onSignUp;

  const LocationSelection({
    super.key,
    required this.mapController,
    required this.controller,
    required this.setStep,
    required this.onSignUp,
  });

  @override
  State<LocationSelection> createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  bool notTrainUser = false;

  List<POI> pois = [];
  POI? homeStation;
  POI? workStation;

  LatLng currentPos = LatLng(51.24, -0.57);

  // API'S
  final OverpassApi _overpassApi = OverpassApi();
  final MapController _mapController = MapController();

  Future<void> loadPOIs(LatLng position, {double area = 0.02}) async {
    try {
      List<POI> response = await _overpassApi.getPOIsByArea(
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

  // Proccessing Location Selection
  void setWork(work) {
    setState(() {
      workStation = work;
    });
  }

  void setHome(home) {
    setState(() {
      homeStation = home;
    });
  }

  @override
  void initState() {
    super.initState();
    loadPOIs(LatLng(51.24, -0.57));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          MyMap(controller: _mapController, coord: currentPos, pois: pois),
          ...topBar(
            currentStep: 3,
            setStep: widget.setStep,
            controller: widget.controller,
          ),
          Positioned(
            top: 60,
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
                        hintText: "Drag down menu to use map UI",
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
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.15,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Select Your Stations",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Spacer(),
                        GestureDetector(child: Text("Skip")),
                      ],
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Set Home Station"),
                      onTap: () {
                        // Do something with map tap or selection
                      },
                    ),
                    DropdownButton<POI>(
                      value: homeStation,
                      isExpanded: true,
                      hint: Text("Choose a station"),
                      items:
                          pois.map((POI poi) {
                            return DropdownMenuItem<POI>(
                              value: poi,
                              child: Text(poi.name ?? "Unnamed Station"),
                            );
                          }).toList(),
                      onChanged: (POI? newValue) {
                        setHome(newValue!);
                        print("Selected home station: ${newValue?.name}");
                      },
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.work),
                      title: Text("Set Work Station"),
                      onTap: () {
                        // Do something with map tap or selection
                      },
                    ),
                    DropdownButton<POI>(
                      value: workStation,
                      isExpanded: true,
                      hint: Text("Choose a station"),
                      items:
                          pois.map((POI poi) {
                            return DropdownMenuItem<POI>(
                              value: poi,
                              child: Text(poi.name ?? "Unnamed Station"),
                            );
                          }).toList(),
                      onChanged: (POI? newValue) {
                        setWork(newValue!);
                        print("Selected work station: ${newValue?.name}");
                      },
                    ),
                    SizedBox(height: 22),
                    Row(
                      children: [
                        Checkbox(
                          value: notTrainUser,
                          onChanged: (bool? value) {
                            setState(() {
                              notTrainUser = value ?? false;
                            });
                          },
                        ),
                        Text("I do not use trains (change later)"),
                      ],
                    ),
                    SizedBox(height: 22),
                    MyButton(
                      onTap: () => {widget.onSignUp()},
                      text: "Finish Sign up",
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
