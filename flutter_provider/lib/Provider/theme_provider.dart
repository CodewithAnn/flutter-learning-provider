import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;
  late ThemeData _isDarkMode;
  ThemeData get isDarkMode => _isDarkMode;

  ThemeData dark = ThemeData.dark();
  ThemeData light = ThemeData.light();

  ThemeProvider({required bool darkMode}) {
    _isDarkMode = darkMode ? dark : light;
  }

  void getTheme(bool mode) {
    if (_isDarkMode == dark) {
      _isDarkMode = light;
      isDark = mode;
    } else {
      _isDarkMode = dark;
      isDark = mode;
    }
    notifyListeners();
  }
}
