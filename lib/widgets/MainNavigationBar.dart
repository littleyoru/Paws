import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'AdoptionScreen.dart';

class MainNavigationBar extends StatefulWidget {
  @override
  State<MainNavigationBar> createState() => MainNavigationBarState();
  //MainNavigationBar({Key? key}) : super(key: key);
}

class MainNavigationBarState extends State<MainNavigationBar> {
  final List<Widget> pages = [
    // HomeScreen(key: PageStorageKey('Home')),
    AdoptionScreen(key: PageStorageKey('Adoption')),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _mainNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.night_shelter_outlined), label: 'Adoption'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Missing'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle_rounded), label: 'Services'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets_rounded), label: 'Pet profiles')
        ],
        // onTap: () {},
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _mainNavigationBar(_selectedIndex),
      body: PageStorage(
        bucket: bucket,
        child: pages[_selectedIndex],
      ),
    );
  }
}
