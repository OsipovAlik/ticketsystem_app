import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    onPrimary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
    onSecondary: Colors.grey.shade100,
  ),
  primaryTextTheme:const TextTheme(
   headlineLarge: ThemeText.w34b,
   labelLarge: ThemeText.b16,
   titleMedium: ThemeText.b14,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontSize: 12, color: CustomColors.cyan),
    headlineLarge: ThemeText.w34b,
    displayLarge: ThemeText.b22b,
    displayMedium: ThemeText.b20b,
    displaySmall: ThemeText.b18b,
    labelLarge: ThemeText.b16b,
    titleMedium: ThemeText.b14b,
    titleSmall: ThemeText.b12b,
   
    
  ),
  appBarTheme: AppBarTheme(
    color: Colors.grey.shade400,
    titleTextStyle:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    iconTheme:const IconThemeData(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // primary: Colors.grey.shade300, // Background color
      // onPrimary: Colors.black, // Text color
      textStyle:const TextStyle(fontWeight: FontWeight.bold),
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
  colorScheme: ColorScheme.dark(
    primary: CustomColors.blueBold,
    onPrimary: Colors.grey.shade700,
    secondary: Colors.grey.shade600,
    onSecondary: Colors.white,
  ),
  primaryTextTheme:const TextTheme(
   headlineLarge: ThemeText.w34b,
    labelLarge: ThemeText.w16,
    titleMedium: ThemeText.w14,
   
  ),
  textTheme: const TextTheme(
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
    color: Colors.grey.shade800,
    titleTextStyle:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    iconTheme:const IconThemeData(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // primary: Colors.grey.shade700, // Background color
      // onPrimary: Colors.white, // Text color
      textStyle:const TextStyle(fontWeight: FontWeight.bold),
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
