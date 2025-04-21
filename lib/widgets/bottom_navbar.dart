import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/home.dart';
import 'package:flutter_mobile_app/screens/profile.dart';
import 'package:flutter_mobile_app/screens/settings.dart';
// import 'package:flutter_mobile_app/screens/settings___.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Home(), // home == journeys
    Settings(),
    Profile(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        // useLegacyColorScheme: true,
        // backgroundColor: Color.fromRGBO(0, 98, 255, 1),
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home/Journeys",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Start"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
