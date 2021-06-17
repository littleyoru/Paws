import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paws/state/bottom_nav_provider.dart';
import '../constants/custom_colors.dart';

class TempBottomBar extends StatelessWidget {
  TempBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<BottomNavigatorProvider>(context);
    return BottomAppBar(
      // child: IconTheme(
      //   data: IconThemeData(color: CustomColors.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/adoption', (Route<dynamic> route) => false);
              },
              icon: Icon(Icons.night_shelter_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.pets)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.person_pin_circle_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.pets_rounded)),
        ],
      ),
      // ),
    );
  }
}
