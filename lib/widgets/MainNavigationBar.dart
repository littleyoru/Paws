import 'package:flutter/material.dart';
import 'package:paws/state/bottom_nav_provider.dart';
import 'package:provider/provider.dart';
import '../state/user_repository.dart';

class MainNavigationBar extends StatelessWidget {
  MainNavigationBar({Key? key}) : super(key: key);
  // final List<Widget> pages = [
  //   // HomeScreen(key: PageStorageKey('Home')),
  //   AdoptionScreen(key: PageStorageKey('Adoption')),
  // ];

  // final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<BottomNavigatorProvider>(context);
    debugPrint('nav info ${nav.selectedIndex}');
    return BottomNavigationBar(
      onTap: (int index) => nav.onTap(index),
      currentIndex: nav.selectedIndex ?? 1,
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
  }
}
