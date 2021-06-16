import 'package:flutter/material.dart';
import '../state/user_repository.dart';

// abstract class MainRoutePath {}

// class SplashPagePath extends MainRoutePath {
//   static const String splashPageLocation = '/';
// }

// class LoginPagePath extends MainRoutePath {
//   static const String loginPageLocation = '/login';
// }

// class RegisterPagePath extends MainRoutePath {
//   static const String registerPageLocation = '/register';
// }

// class ProfilePagePath extends MainRoutePath {
//   static const String profilePageLocation = '/profile';
// }

// class HomePagePath extends MainRoutePath {
//   static const String homePageLocation = '/home';
// }

// class AdoptionPagePath extends MainRoutePath {
//   static const String adoptionPageLocation = '/adoption';
// }

var loginStatus = [Status.Unauthenticated, Status.Authenticating];

// possible routes and configurations for each
class MainRoutePath {
  final int? selectedIndex;
  // final bool isUnknown;
  final Status status;

  MainRoutePath.splash()
      : selectedIndex = null,
        status = Status.Uninitialized;

  MainRoutePath.login()
      : selectedIndex = null,
        // isUnknown = false,
        status = Status.Unauthenticated;
  // MainRoutePath.register()
  //     : selectedIndex = null,
  //       isUnknown = false,
  //       isAuth = false;

  MainRoutePath.home()
      : selectedIndex = 0,
        // isUnknown = false,
        status = Status.Authenticated;
  MainRoutePath.adoption()
      : selectedIndex = 1,
        // isUnknown = false,
        status = Status.Authenticated;

  // MainRoutePath.unknown()
  //     : selectedIndex = null,
  //       // isUnknown = true,
  //       isAuth = null;
  bool get isHomePage => selectedIndex == 0;
  bool get isAdoptionPage => selectedIndex == 1;
  bool get isLoginPage => loginStatus.contains(status);
}

// old

// @immutable
// abstract class PageRoutePath {
//   const PageRoutePath();
// }

// class RegisterPagePath extends PageRoutePath {
//   static const String registerPageLocation = 'register';
//   const RegisterPagePath();
// }

// class LoginPagePath extends PageRoutePath {
//   static const String loginPageLocaiton = 'login';
//   const LoginPagePath();
// }

// class HomePagePath extends PageRoutePath {
//   static const String homePageLocation = 'home';
//   const HomePagePath();
//}

// class AdoptPetPath extends PageRoutePath {
//   static const String adoptPetLocation = 'adopt';
//   const AdoptPetPath(this.petPath);

//   final String petPath;
// }

// class AdoptionPagePath extends PageRoutePath {
//   static const String adoptionPageLocation = 'adoption';
//   const AdoptionPagePath();

//   //final String petPath;
// }

// class MissingPagePath extends PageRoutePath {
//   static const String missingPageLocation = 'missing';
//   const MissingPagePath();
// }
