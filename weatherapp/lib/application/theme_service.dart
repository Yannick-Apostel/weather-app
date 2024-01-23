import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkModeOn = false;

  void toggleThemme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}