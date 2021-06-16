// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import '../../../constants/api_path.dart';
// import '../login/loginResponse.dart';

// const String _AUTH_KEY = 'AuthKey';

// class AuthRepository with ChangeNotifier {
//   String _token = '';
//   // final SharedPreferences preference;
//   // AuthRepository(this.preference);

//   Future init() async {
//     final prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString(_AUTH_KEY) ?? '';
//     _token = token;
//   }

//   bool isUserLoggedIn() {
//     return _token.isNotEmpty ? true : false;
//   }

//   Future<bool> _updateLoginStatus(bool loggedIn, dynamic data) =>
//       loginUser(data).then((token) {
//         // Future.delayed(Duration(seconds: 2)).then((value) {
//         return preference.setBool(_AUTH_KEY, loggedIn) ?? false;
//       });

//   Future<bool> logout(data) => _updateLoginStatus(false, data);
//   Future<bool> login(data) => _updateLoginStatus(true, data);

//   Future<String> loginUser(data) async {
//     final uri = Uri.parse('$API_URL/user/login');
//     var body = json.encode(data);
//     final response = await http.post(uri,
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//           // HttpHeaders.authorizationHeader: 'Bearer '
//         },
//         body: body,
//         encoding: Encoding.getByName("utf-8"));

//     if (response.statusCode == 200) {
//       debugPrint('response body data: ${response.body}');
//       debugPrint('response headers: ${response.headers}');
//       final responseJson = jsonDecode(response.body);
//       final loginResponse = LoginResponse.fromJson(responseJson);
//       debugPrint('login response parsed: $loginResponse');
//       debugPrint('login data: ${loginResponse.data?.token}');
//       return loginResponse.data?.token ?? '';
//     } else {
//       throw Exception('Failure in the api');
//     }
//   }
// }
