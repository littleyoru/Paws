import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import '../login/loginActions.dart';

const String _AUTH_KEY = 'AuthKey';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  // User? _user;
  Status _status = Status.Uninitialized;
  String _token = '';
  // SharedPreferences? preference;
  // UserRepository();

  Status get status => _status;
  // User? get authUser => _user;
  String get token => _token;

  Future init() async {
    var pref = await SharedPreferences.getInstance();
    String token = pref.getString(_AUTH_KEY) ?? '';
    _token = token;
  }

  // bool isUserLoggedIn() {
  //   return _token.isNotEmpty ? true : false;
  // }

  Future<bool> setToken(String token) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(_AUTH_KEY, token).then((value) {
      debugPrint('token saved');
      return true;
    }).catchError((err) {
      debugPrint('error in saving token');
      return false;
    });
    return false;
  }

  Future<bool> deleteToken() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(_AUTH_KEY, '').then((value) {
      debugPrint('token saved');
      return true;
    }).catchError((err) {
      debugPrint('error in saving token');
      return false;
    });
    return false;
  }

  Future<bool> signIn(data) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      var res = await loginUser(data);
      debugPrint('res token $res');
      _status = Status.Authenticated;
      _token = res;
      notifyListeners();
      debugPrint('user status $_status');
      var isTokenSaved = await setToken(res);
      // _user = res.user;
      // _token = res.token;
      return isTokenSaved;
    } catch (err) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    var res = await deleteToken();
    _status = Status.Unauthenticated;
    _token = '';
    notifyListeners();
    return res;
  }
}
