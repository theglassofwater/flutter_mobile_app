import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/home.dart';
import 'package:flutter_mobile_app/screens/map_view.dart';
import 'package:flutter_mobile_app/screens/profile.dart';

class BottomNavBar extends StatefulWidget {
  // const BottomNavBar({super.key, Key? key});
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Home(), // home == journeys
    MapView(),
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
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.train_sharp), // Icons.adjust_sharp
            label: "Map",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
