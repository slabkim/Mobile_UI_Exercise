import 'package:flutter/material.dart';

/// Provider untuk mengelola mode tema aplikasi
class ThemeProvider extends ChangeNotifier {
  /// Mode tema saat ini
  ThemeMode _themeMode = ThemeMode.system;

  /// Ambil mode tema
  ThemeMode get themeMode => _themeMode;

  /// Set mode tema (terang, gelap, atau sistem)
  void setThemeMode(ThemeMode? mode) {
    if (mode == null || mode == _themeMode) return;
    _themeMode = mode;
    notifyListeners();
  }
}
