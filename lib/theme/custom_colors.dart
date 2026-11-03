import 'package:flutter/material.dart';
import 'package:ticketsystem/global/global.dart';

/// Central color palette. Colors that must flip between dark/light mode are
/// exposed as getters that read the app-wide [isDarkMode] flag (kept in sync
/// by ThemeProvider), so every reference — `CustomColors.blueBold` etc. —
/// stays reactive without callers needing a BuildContext.
class CustomColors {
  // Accent/semantic colors — same in both themes.
  static const Color blue = Color(0xFF007AFF);
  static const Color cyan = Color.fromARGB(255, 49, 215, 169);
  static const Color text1 = Color.fromRGBO(3, 32, 85, 0);
  static const Color text2 = Color.fromRGBO(85, 96, 255, 1);
  static const Color text3 = Color.fromARGB(255, 104, 42, 180);
  static const Color redMain = Color.fromARGB(255, 235, 83, 67);
  static const Color inputGrey = Color.fromRGBO(162, 162, 162, 1);
  static const Color loadBaseColor = Color.fromARGB(255, 234, 234, 234);
  static const Color loadHighlightColor = Color.fromARGB(255, 243, 243, 243);

  // Dark-mode literal values (unchanged from the original palette).
  static const Color _blueTabDark = Color.fromARGB(255, 34, 58, 104);
  static const Color _blueLightDark = Color.fromARGB(255, 2, 31, 86);
  static const Color _blueBoldDark = Color.fromARGB(255, 0, 18, 50);
  static const Color _blueBtnDetailsDark = Color.fromARGB(255, 20, 31, 64);
  static const Color _inputBlueDark = Color.fromARGB(255, 51, 51, 90);
  static const Color _loginCardBlueDark = Color.fromARGB(255, 3, 22, 47);
  static const Color _textGreyDark = Color.fromRGBO(219, 216, 216, 1);
  static const Color _textPrimaryDark = Colors.white;

  // Light-mode equivalents.
  static const Color _blueTabLight = Color.fromARGB(255, 223, 229, 245);
  static const Color _blueLightLight = Color.fromARGB(255, 255, 255, 255);
  static const Color _blueBoldLight = Color.fromARGB(255, 244, 246, 250);
  static const Color _blueBtnDetailsLight = Color.fromARGB(255, 233, 237, 246);
  static const Color _inputBlueLight = Color.fromARGB(255, 234, 237, 244);
  static const Color _loginCardBlueLight = Color.fromARGB(255, 255, 255, 255);
  static const Color _textGreyLight = Color.fromARGB(255, 70, 76, 87);
  static const Color _textPrimaryLight = Color.fromARGB(255, 10, 20, 40);

  static Color get blueTab => isDarkMode ? _blueTabDark : _blueTabLight;
  static Color get blueLight => isDarkMode ? _blueLightDark : _blueLightLight;
  static Color get blueBold => isDarkMode ? _blueBoldDark : _blueBoldLight;
  static Color get blueBtnDetails => isDarkMode ? _blueBtnDetailsDark : _blueBtnDetailsLight;
  static Color get inputBlue => isDarkMode ? _inputBlueDark : _inputBlueLight;
  static Color get loginCardBlue => isDarkMode ? _loginCardBlueDark : _loginCardBlueLight;
  static Color get textGrey => isDarkMode ? _textGreyDark : _textGreyLight;

  /// Primary text/icon color on the app's main surfaces (blueBold/blueLight/
  /// inputBlue). White in dark mode, near-black in light mode.
  static Color get textPrimary => isDarkMode ? _textPrimaryDark : const Color.fromARGB(255, 59, 62, 66);
}
