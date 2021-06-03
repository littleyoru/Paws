import 'package:flutter/material.dart';
import 'package:paws/core/auth/RegisterScreen.dart';
import 'package:paws/widgets/HomeScreen.dart';
import '../utils/helpers/color_helper.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(
      {Key key,
      @required this.title,
      @required this.isLoggedIn,
      this.showBackButton})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  final String title;
  final bool isLoggedIn;
  final bool showBackButton;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title != null ? title : ''),
      centerTitle: true,
      leading: showBackButton != null && showBackButton == true
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            isLoggedIn ? Icons.settings : Icons.account_circle,
            color: createMaterialColor(Color(0xFF38261F)),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ),
          ),
        ),
      ],
    );
  }
}

class MyIcons {
  static const IconData male = IconData(0xF029D, fontFamily: 'MatIcons');
  static const IconData female = IconData(0xF029C, fontFamily: 'MatIcons');
}
