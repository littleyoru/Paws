import 'package:flutter/material.dart';
import 'package:paws/core/auth/login/LoginScreen.dart';
import '../utils/helpers/color_helper.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isLoggedIn;
  final bool showBackButton;
  final bool showLogout;
  @override
  final Size preferredSize;

  CustomAppBar(
      {Key? key,
      required this.title,
      required this.isLoggedIn,
      this.showBackButton = false,
      this.showLogout = false})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        centerTitle: true,
        leading: showBackButton
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        actions: showLogout
            ? <Widget>[
                IconButton(
                  icon: Icon(
                    isLoggedIn ? Icons.settings : Icons.account_circle,
                    color: createMaterialColor(Color(0xFF38261F)),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),
                ),
              ]
            : null);
  }
}

class MyIcons {
  static const IconData male = IconData(0xF029D, fontFamily: 'MatIcons');
  static const IconData female = IconData(0xF029C, fontFamily: 'MatIcons');
}
