import 'package:flutter/cupertino.dart';

class BottomNavigatorProvider with ChangeNotifier {
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  set selectedIndex(int? value) {
    if (value != _selectedIndex) {
      _selectedIndex = value;
      notifyListeners();
    }
  }

  void onTap(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  BottomNavigatorProvider();
}
