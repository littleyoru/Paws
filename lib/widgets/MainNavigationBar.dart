import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'AdoptionScreen.dart';

class MainNavigationBar extends StatelessWidget {
  MainNavigationBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);
  // final List<Widget> pages = [
  //   // HomeScreen(key: PageStorageKey('Home')),
  //   AdoptionScreen(key: PageStorageKey('Adoption')),
  // ];

  final int selectedIndex;
  final ValueChanged<int> onTap;

  Widget _mainNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => this.onTap(index),
        currentIndex: this.selectedIndex,
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
        // onTap: (inx) {appState.selectedIndex = inx;},
      );

  @override
  Widget build(BuildContext context) {
    return _mainNavigationBar(selectedIndex);
  }
}
