import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/home.dart';
import 'package:flutter_mobile_app/screens/journeys.dart';
import 'package:flutter_mobile_app/screens/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 3;

  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Settings(),
    Settings(),
    Journeys(),
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
        // elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "sdfbfsid",
            // backgroundColor: Color.fromRGBO(0, 98, 255, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "fsdfs",
            // backgroundColor: Color.fromRGBO(0, 98, 255, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "fsdfs",
            // backgroundColor: Color.fromRGBO(0, 98, 255, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "Journeys",
            // backgroundColor: Color.fromRGBO(0, 98, 255, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
