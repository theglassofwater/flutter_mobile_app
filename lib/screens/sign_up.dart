import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/screens/login.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/widgets/bottom_navbar.dart';
import 'package:latlong2/latlong.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SignUpPage(title: 'SignUp');
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controller = PageController();
  int currentStep = 1;

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
      // backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        children: [_signUpPage(), _locationPage()],
      ),
    );
  }

  Widget _signUpPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...topBar(currentStep),
        Spacer(), // Put image or something
        FadeInUp(
          delay: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 1200),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        FadeInUp(
          delay: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 800),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.key),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        FadeInUp(
          delay: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 800),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.key),
              labelText: "Repeat Password",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 80),
        Row(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              // height: 50,
              onPressed:
                  () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()),
                    ),
                  },
              child: Text(
                " Register ",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            MaterialButton(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),

              // height: 50,
              onPressed:
                  () => {
                    controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    ),
                    setState(() {
                      currentStep = 2;
                    }),
                  },
              child: Text(
                "Next Step",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an acount?"),
            TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ),
              child: Text(
                "Login",
                style: TextStyle(color: MyColors.darkPurple),
              ),
            ),
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }

  Widget _locationPage() {
    return Expanded(
      child: Stack(
        children: [
          FlutterMap(
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
          ...topBar(currentStep),
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
    );
  }

  List<Widget> topBar(int currentStep) {
    return [
      LinearProgressIndicator(
        value: currentStep / 2, // e.g. 0.5 for step 1, 1.0 for step 2
        backgroundColor: Colors.grey[300],
        color: MyColors.darkPurple,
      ),
      Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Icon(
                  Icons.looks_one_rounded,
                  color: currentStep >= 1 ? MyColors.darkPurple : Colors.grey,
                ),
                Text(
                  "Quick Sign Up",
                  style: TextStyle(
                    color: currentStep >= 1 ? MyColors.darkPurple : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Icon(
                  Icons.looks_two_rounded,
                  color: currentStep >= 2 ? MyColors.darkPurple : Colors.grey,
                ),
                Text(
                  "Set Locations (Optional)",
                  style: TextStyle(
                    color: currentStep >= 2 ? MyColors.darkPurple : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }
}
