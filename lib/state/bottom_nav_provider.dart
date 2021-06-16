import 'package:flutter/cupertino.dart';

class BottomNavigatorProvider with ChangeNotifier {
  int? _selectedIndex = 0;
  int? get selectedIndex => _selectedIndex;

  set selectedIndex(int? value) {
    if (value != _selectedIndex) {
      _selectedIndex = value;
      notifyListeners();
    }
  }

  onTap(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  BottomNavigatorProvider();
}
