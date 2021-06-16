import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paws/core/auth/login/LoginScreen.dart';
import 'package:paws/core/auth/register/RegisterScreen.dart';
import 'package:paws/routers/routes.dart';
import 'package:paws/state/user_repository.dart';
import 'package:paws/widgets/AdoptionScreen.dart';
import 'package:paws/widgets/HomeScreen.dart';
import 'package:paws/widgets/ProfileScreen.dart';
import 'package:paws/widgets/SplashScreen.dart';
import '../state/bottom_nav_provider.dart';
import '../core/auth/login/LoginPage.dart';
import 'HomePage.dart';

class PawsAppRouterDelegate extends RouterDelegate<MainRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MainRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  // get app state instance
  UserRepository appState = UserRepository();
  // get the bottom navigation state
  BottomNavigatorProvider bottomNavState = BottomNavigatorProvider();

  // bool _loggedIn = false;
  // bool get loggedIn => _loggedIn;
  // set loggedIn(value) {
  //   _loggedIn = value;
  //   notifyListeners();
  // }

  // final UserRepository userRepository;

  // accept the model as a param, and listen to it for changes. Rebuild anytime model changes.
  PawsAppRouterDelegate(this.appState, this.bottomNavState)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
    bottomNavState.addListener(notifyListeners);
    _init();
  }

  _init() async {
    await appState.init();
    notifyListeners();
  }

  MainRoutePath get currentConfiguration {
    debugPrint('current configuration: ${appState.status}');
    if (appState.status == Status.Uninitialized) {
      return MainRoutePath.splash();
    }
    if (appState.status == Status.Unauthenticated) {
      return MainRoutePath.login();
    }
    return bottomNavState.selectedIndex == 0
        ? MainRoutePath.home()
        : MainRoutePath.adoption();
  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    if (appState.status == Status.Uninitialized) {
      stack = _splashStack;
    } else if (appState.status == Status.Authenticated) {
      stack = _loggedInStack;
    } else {
      stack = _loggedOutStack;
    }
    debugPrint('user status: ${appState.status}');
    debugPrint('stack status: $stack');
    debugPrint('bottom nav index: ${bottomNavState.selectedIndex}');
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        notifyListeners();
        return true;
      },
    );
  }

  List<MaterialPage> get _splashStack => [
        MaterialPage(
            key: ValueKey('Splash'),
            child: SplashScreen(),
            arguments: {'auth': false})
      ];

  List<MaterialPage> get _loggedOutStack => [
        MaterialPage(
            key: ValueKey('Login'),
            child: LoginScreen(),
            arguments: {'auth': true}),
      ];

  List<MaterialPage> get _loggedInStack {
    return [
      MaterialPage(key: ValueKey('Home'), child: HomeScreen()),
      if (bottomNavState.selectedIndex == 1)
        MaterialPage(key: ValueKey('Adoption'), child: AdoptionScreen()),
      // MaterialPage(key: ValueKey('Profile'), child: ProfileScreen()),
    ];
  }

  // _clear() {}

  @override
  Future<void> setNewRoutePath(MainRoutePath path) async {
    if (path.status == Status.Uninitialized) {
      bottomNavState.selectedIndex = null;
      return;
    }

    if (path.isHomePage || path.isAdoptionPage) {
      if (path.status != Status.Authenticated) {
        bottomNavState.selectedIndex = null;
        return;
      }
      bottomNavState.selectedIndex = path.selectedIndex;
    } else {
      bottomNavState.selectedIndex = null;
    }
  }
}
