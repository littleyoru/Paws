import 'package:flutter/cupertino.dart';
import 'package:paws/core/auth/models/auth_repository.dart';
import 'package:paws/core/auth/models/user_repository.dart';
import 'package:paws/widgets/HomeScreen.dart';
import '../core/auth/login/LoginPage.dart';
import 'HomePage.dart';

class PawsAppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  set loggedIn(value) {
    _loggedIn = value;
    notifyListeners();
  }

  // final AuthRepository authRepository;
  final UserRepository userRepository;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  PawsAppRouterDelegate(this.userRepository)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    await userRepository.init();
    loggedIn = userRepository.token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    List<Page> stack;
    if (loggedIn == null) {
      stack = _splashStack;
    } else if (loggedIn) {
      stack = _loggedInStack;
    } else {
      stack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }

  List<Page> get _splashStack =>
      [SplashPage('Splash Screen:\n\nChecking auth state')];

  List<Page> get _loggedOutStack => [
        LoginPage(onLogin: () {
          loggedIn = true;
        })
      ];

  List<Page> get _loggedInStack {
    final onLogout = () {
      loggedIn = false;
      _clear();
    };
    return [HomePage(onLogout: onLogout)];
  }

  _clear() {}

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
