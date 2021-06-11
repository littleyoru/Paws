import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paws/constants/custom_colors.dart';
import 'package:paws/core/auth/register/RegisterScreen.dart';
import 'package:paws/core/auth/login/LoginScreen.dart';

// theme
import 'config/themes/custom_theme.dart';

// models
import 'core/auth/models/user_repository.dart';

// utils
import 'utils/helpers/color_helper.dart';

// custom widgets
import 'widgets/HomeScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserRepository(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Pawesome',
        theme: ThemeData(
          primarySwatch: CustomColors.primarySwatch,
          scaffoldBackgroundColor: createMaterialColor(Color(0xFFE3DFF2)),
          inputDecorationTheme: customInputDecorationTheme(),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(title: 'Paws', isLoggedIn: true),
        },
      ),
    );
  }
}

// class MyIcons {
//   static const IconData male = IconData(0xF029D, fontFamily: 'MatIcons');
//   static const IconData female = IconData(0xF029C, fontFamily: 'MatIcons');
// }
