import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/screen/homeScreen/homeScreen.dart';
import 'package:movie_app/screen/profileScreen/profileScreen.dart';

class BottomNavMain extends StatefulWidget {
  const BottomNavMain({Key? key}) : super(key: key);

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  int _selectedIndex = 0;
  late Timer timer;
  bool isRelayActive = false;
  dynamic previousTime;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text("halaman2"),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Color(0xff25233D),
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Manual Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.3),
      ),
    );
  }
}
