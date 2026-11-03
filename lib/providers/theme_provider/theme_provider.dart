import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketsystem/global/global.dart' as app_global;

/// Drives the app's theme mode (system/light/dark), keeps it in sync with
/// [app_global.isDarkMode] (read synchronously by CustomColors/ThemeText/
/// MyBoxDecoration, which have no BuildContext of their own), persists the
/// user's choice, and reacts to the device's own appearance setting when
/// mode is "system".
class ThemeProvider extends ChangeNotifier with WidgetsBindingObserver {
  static const String _prefsKey = 'themeMode';

  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  bool get isDark {
    switch (_themeMode) {
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:
        final brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;
        return brightness == Brightness.dark;
    }
  }

  ThemeProvider() {
    WidgetsBinding.instance.addObserver(this);
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_prefsKey);
    switch (stored) {
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      case 'system':
        _themeMode = ThemeMode.system;
        break;
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
      default:
        // No saved preference yet: keep the app's original always-dark
        // behavior for existing installs instead of silently switching them.
        _themeMode = ThemeMode.dark;
    }
    app_global.isDarkMode = isDark;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    app_global.isDarkMode = isDark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, mode.name);
  }

  @override
  void didChangePlatformBrightness() {
    if (_themeMode == ThemeMode.system) {
      app_global.isDarkMode = isDark;
      notifyListeners();
    }
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
