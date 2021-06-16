import 'package:flutter/cupertino.dart';
import 'package:paws/state/user_repository.dart';
import 'routes.dart';

class MainRouteInformationParser extends RouteInformationParser<MainRoutePath> {
  @override
  Future<MainRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    debugPrint('uri: $uri');

    // if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'home') {
    //   return HomePagePath();
    // }
    if (uri.pathSegments.isEmpty) {
      return MainRoutePath.splash();
    }
    if (uri.pathSegments.isNotEmpty) {
      switch (uri.pathSegments.first) {
        case 'home':
          return MainRoutePath.home();
        case 'login':
          return MainRoutePath.login();
        // case 'register':
        //   return MainRoutePath.register();
        // case 'profile':
        //   return MainRoutePath.profile();
        case 'adoption':
          return MainRoutePath.adoption();
      }
    }
    return MainRoutePath.splash();
  }

  @override
  RouteInformation restoreRouteInformation(MainRoutePath path) {
    debugPrint('restore route - config ${path.status} - ${path.selectedIndex}');
    if (path.status == Status.Uninitialized) {
      return RouteInformation(location: '/');
    }
    if (path.isLoginPage) {
      return RouteInformation(location: '/login');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/home');
    }
    if (path.isAdoptionPage) {
      return RouteInformation(location: '/adoption');
    }

    // if (config is LoginPagePath) {
    //   return RouteInformation(location: '/login');
    // }
    // if (config is RegisterPagePath) {
    //   return RouteInformation(location: '/register');
    // }
    // if (config is ProfilePagePath) {
    //   return RouteInformation(location: '/profile');
    // }
    // if (config is HomePagePath) {
    //   return RouteInformation(location: '/home');
    // }
    // if (config is AdoptionPagePath) {
    //   return RouteInformation(location: '/adoption');
    // }
    return RouteInformation(location: '/');
  }
}
