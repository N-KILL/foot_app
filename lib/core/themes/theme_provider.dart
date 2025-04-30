import 'package:flutter/material.dart';
import 'package:foot_app/core/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeMode = lightTheme;

  ThemeData get themeMode => _themeMode;

  set themeMode(ThemeData themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}
