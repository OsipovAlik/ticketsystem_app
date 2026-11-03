import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';

/// Fallback ThemeData for native Material widgets that don't get their
/// color from CustomColors/ThemeText directly (Dialog, SnackBar, TextField
/// decoration defaults, DatePicker, etc). Most of the app's own screens pull
/// colors straight from CustomColors, which already reacts to the active
/// theme — these ThemeData objects just need to not look broken underneath.
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromARGB(255, 244, 246, 250),
  cardColor: Colors.white,
  dividerColor: Colors.grey.shade300,
  colorScheme: ColorScheme.light(
    primary: CustomColors.blue,
    onPrimary: Colors.white,
    secondary: CustomColors.cyan,
    onSecondary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black87,
  ),
  primaryTextTheme: TextTheme(
   headlineLarge: ThemeText.w34b,
   labelLarge: ThemeText.b16,
   titleMedium: ThemeText.b14,
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(fontSize: 12, color: CustomColors.cyan),
    headlineLarge: ThemeText.b34b,
    displayLarge: ThemeText.b22b,
    displayMedium: ThemeText.b20b,
    displaySmall: ThemeText.b18b,
    labelLarge: ThemeText.b16b,
    titleMedium: ThemeText.b14b,
    titleSmall: ThemeText.b12b,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 244, 246, 250),
    titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  snackBarTheme: SnackBarThemeData(backgroundColor: Colors.grey.shade800),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: CustomColors.blueBold,
  cardColor: CustomColors.blueLight,
  dividerColor: Colors.grey.shade700,
  colorScheme: ColorScheme.dark(
    primary: CustomColors.blueBold,
    onPrimary: Colors.white,
    secondary: CustomColors.cyan,
    onSecondary: Colors.black,
    surface: CustomColors.blueLight,
    onSurface: Colors.white,
  ),
  primaryTextTheme: TextTheme(
   headlineLarge: ThemeText.w34b,
    labelLarge: ThemeText.w16,
    titleMedium: ThemeText.w14,
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(fontSize: 12, color: Colors.white),
    headlineLarge: ThemeText.w34b,
    displayLarge: ThemeText.w22b,
    displayMedium: ThemeText.w20b,
    displaySmall: ThemeText.w18b,
    labelLarge: ThemeText.w16b,
    titleMedium: ThemeText.w14b,
    titleSmall: ThemeText.w12b,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: CustomColors.blueBold,
    titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  dialogTheme: DialogThemeData(backgroundColor: CustomColors.blueBold),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: CustomColors.blueBold),
  snackBarTheme: SnackBarThemeData(backgroundColor: CustomColors.blueLight),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade800,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade600),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade600),
    ),
  ),
);
