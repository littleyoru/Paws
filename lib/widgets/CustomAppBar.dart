import 'package:flutter/material.dart';
import '../utils/helpers/color_helper.dart';
import 'ProfileScreen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isLoggedIn;
  final bool showBackButton;
  final bool showLogout;
  // final VoidCallback? onLogout;
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    }),
              ]
            : null);
  }
}
