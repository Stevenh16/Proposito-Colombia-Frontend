import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../config/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    _detectSystemTheme();
  }

  ThemeMode get themeMode => _themeMode;
  ThemeData get lightTheme => AppTheme.lightTheme;
  ThemeData get darkTheme => AppTheme.darkTheme;

  bool get isDark {
    if (_themeMode == ThemeMode.system) {
      return SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  void _detectSystemTheme() {
    final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    _themeMode = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}