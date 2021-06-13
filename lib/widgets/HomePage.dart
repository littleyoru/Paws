import 'package:flutter/material.dart';
import 'HomeScreen.dart';

class HomePage extends Page {
  // final Function(String) onColorTap;
  final VoidCallback onLogout;

  HomePage({
    required this.onLogout,
  }) : super(key: ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen(
          onLogout: onLogout,
        );
      },
    );
  }
}
