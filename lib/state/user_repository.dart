import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/auth/login/loginActions.dart';

const String _AUTH_KEY = 'AuthKey';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  // User? _user;
  Status _status = Status.Uninitialized;
  String _token = '';
  // SharedPreferences? preference;
  UserRepository();

  Status get status => _status;
  // User? get authUser => _user;
  String get token => _token;

  set status(Status value) {
    if (value != _status) {
      _status = value;
      notifyListeners();
    }
  }

  set token(String value) {
    if (value != _token) {
      _token = value;
      notifyListeners();
    }
  }

  Future<bool> init() async {
    var pref = await SharedPreferences.getInstance();
    String tkn = pref.getString(_AUTH_KEY) ?? '';
    debugPrint('token from memory: $token');
    token = tkn;
    status = tkn.isEmpty ? Status.Unauthenticated : Status.Authenticated;
    debugPrint('user status after token get: $status');
    debugPrint('user _status after token get: $_status');
    notifyListeners();
    return true;
  }

  // set token in storage
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

  // delete token from storage
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
      status = Status.Authenticating;
      notifyListeners();
      var res = await loginUser(data);
      debugPrint('res token $res');
      status = Status.Authenticated;
      token = res;
      notifyListeners();
      debugPrint('user status $status');
      var isTokenSaved = await setToken(res);
      // _user = res.user;
      // _token = res.token;
      debugPrint('user status $isTokenSaved');
      return isTokenSaved;
    } catch (err) {
      status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      var res = await deleteToken();
      status = Status.Unauthenticated;
      token = '';
      notifyListeners();
      return res;
    } catch (err) {
      debugPrint('error in log out function $err');
      return false;
    }
  }
}
