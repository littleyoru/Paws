import 'package:flutter/material.dart';
import 'package:paws/core/auth/login/LoginScreen.dart';
import 'package:paws/core/auth/register/RegisterScreen.dart';
import 'package:provider/provider.dart';
import 'package:paws/constants/custom_colors.dart';
import 'widgets/PawsAppRouterDelegate.dart';
import 'package:paws/routers/route_info_parser.dart';
import 'state/bottom_nav_provider.dart';
import 'state/user_repository.dart';

// theme
import 'config/themes/custom_theme.dart';

// utils
import 'utils/helpers/color_helper.dart';

// custom widgets
import 'widgets/HomeScreen.dart';
import 'widgets/AdoptionScreen.dart';
import 'widgets/ProfileScreen.dart';
import 'widgets/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserRepository()),
        ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
      ],
      // create: (context) =>
      //     PawsAppRouterDelegate(UserRepository(), BottomNavigatorProvider()),
      child: PawsApp(),
    ),
  );
}

class PawsApp extends StatefulWidget {
//   @override
//   _PawsAppState createState() => _PawsAppState();
//   // This widget is the root of your application.
// }

// class _PawsAppState extends State<PawsApp> {
  // UserRepository userRepository = UserRepository();
  // BottomNavigatorProvider bottomNav = BottomNavigatorProvider();
  // PawsAppRouterDelegate _routerDelegate =
  //     PawsAppRouterDelegate(UserRepository(), BottomNavigatorProvider());
  // MainRouteInformationParser _routeInformationParser =
  //     MainRouteInformationParser();

  // @override
  // void initState() {
  //   _routerDelegate = PawsAppRouterDelegate(userRepository, bottomNav);
  //   // userRepository = UserRepository();
  //   // userRepository.init();
  //   super.initState();
  // }

  @override
  _PawsAppState createState() => _PawsAppState();
}

class _PawsAppState extends State<PawsApp> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserRepository>(context);
    // Widget initialRoute = user.status == Status.Uninitialized
    //     ? SplashScreen()
    //     : user.status == Status.Authenticated
    //         ? HomeScreen()
    //         : LoginScreen();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      // child: Consumer<UserRepository>(
      //   builder: (BuildContext context, userProvider, _) {
      //     return FutureBuilder<bool>(
      //       future: userProvider.init(),
      //       builder:
      //           (BuildContext context, AsyncSnapshot<UserRepository> snapshot) {
      //         if (!snapshot.hasData) {
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //         final UserRepository userState = snapshot.data();
      //         Widget initialScreen = LoginScreen();
      //         if (userState.status == Status.Authenticated) {
      //           initialScreen = HomeScreen(onTap: () {}, selectedIndex: 0);
      //         }

      // child: Consumer<UserRepository>(
      //   builder: (_, notifier, __) {
      // Widget initialRoute = notifier.status == Status.Uninitialized
      //     ? SplashScreen()
      //     : notifier.status == Status.Authenticated
      //         ? HomeScreen()
      //         : LoginScreen();

      child: MaterialApp(
        title: 'Pawesome',
        theme: ThemeData(
          primarySwatch: CustomColors.primarySwatch,
          scaffoldBackgroundColor: createMaterialColor(Color(0xFFE3DFF2)),
          inputDecorationTheme: customInputDecorationTheme(),
        ),
        // routerDelegate: _routerDelegate,
        // routeInformationParser: _routeInformationParser,

        // home: Router(routerDelegate: _routerDelegate),
        // home: initialRoute,
        initialRoute: '/',
        routes: {
          // '/': (context) => SplashScreen(),
          '/': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/profile': (context) => ProfileScreen(),
          '/home': (context) => HomeScreen(),
          '/adoption': (context) => AdoptionScreen(),
        },
      ),
      //   },
      // ),
    );
  }
}
