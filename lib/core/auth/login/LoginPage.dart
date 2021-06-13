import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class LoginPage extends Page {
  final VoidCallback onLogin;

  LoginPage({required this.onLogin}) : super(key: ValueKey('LoginPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => LoginScreen(onLogin: onLogin),
    );
  }
}
