// import 'auth_repository.dart';

// class AuthViewModel {
//   final AuthRepository authRepository;
//   bool logingIn = false;
//   bool logingOut = false;

//   AuthViewModel(this.authRepository);

//   Future<bool> login(data) async {
//     try {
//       logingIn = true;
//       notifyListeners();
//       final result = await authRepository.login(data);
//       debugPrint('res token $result');
//       logingIn = false;
//       notifyListeners();
//       return result;
//     } catch (err) {
//       logingIn = false;
//       return false;
//     }
//   }

//   Future<bool> logout() async {
//     logingOut = true;
//     notifyListeners();
//     final logoutResult = await authRepository.logout();
//     logingOut = false;
//     notifyListeners();
//     return logoutResult;
//   }
// }
