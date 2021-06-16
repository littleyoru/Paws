import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: 300.0,
          height: 300.0,
          child: Image(
              image: AssetImage('assets/graphics/test/Splash.jpeg'),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}
