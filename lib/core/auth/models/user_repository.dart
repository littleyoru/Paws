import 'package:flutter/cupertino.dart';
import 'User.dart';
import '../login/loginActions.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  // User? _user;
  Status _status = Status.Uninitialized;
  String _token = '';

  Status get status => _status;
  // User? get authUser => _user;
  String get token => _token;

  Future<bool> signIn(data) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      var res = await loginUser(data);
      debugPrint('res token $res');
      _status = Status.Authenticated;
      notifyListeners();
      debugPrint('user status $_status');
      // _user = res.user;
      // _token = res.token;
      return true;
    } catch (err) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }
}
