import 'package:flutter/material.dart';

class Themeprovider with ChangeNotifier {
  var themeMode = ThemeMode.light;

  void setTheme(themeModes) {
    themeMode = themeModes;
    notifyListeners();
  }
}
