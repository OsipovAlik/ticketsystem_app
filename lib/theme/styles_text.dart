import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/custom_colors.dart';

/// Text styles. The `w*` family ("white") is the app's primary text style —
/// it sits directly on the main themed surfaces (blueBold/blueLight/
/// inputBlue), so its color now follows [CustomColors.textPrimary] instead
/// of being hardcoded to white. The `b*` ("black") family is only used as a
/// fallback TextTheme for native Material widgets and intentionally stays
/// black/white per ThemeData brightness (set in theme.dart), not here.
abstract class ThemeText {
  static const TextStyle c12 = TextStyle(
      color: CustomColors.cyan, fontSize: 12, fontFamily: 'NotoSansArmenian');
  static const TextStyle c14b = TextStyle(
      color: CustomColors.cyan,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get w12 => TextStyle(
      color: CustomColors.textPrimary, fontSize: 12, fontFamily: 'NotoSansArmenian');
  static const TextStyle b12 = TextStyle(
      color: Colors.black, fontSize: 12, fontFamily: 'NotoSansArmenian');
  static TextStyle get w12b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static const TextStyle b12b = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get blue12b => TextStyle(
      color: CustomColors.blueLight,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get w14 => TextStyle(
      color: CustomColors.textPrimary, fontSize: 14, fontFamily: 'NotoSansArmenian');

  static const TextStyle b14 = TextStyle(
      color: Colors.black, fontSize: 14, fontFamily: 'NotoSansArmenian');

  static TextStyle get w14b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static const TextStyle g14 = TextStyle(
      color: CustomColors.inputGrey,
      fontSize: 14,
      fontFamily: 'NotoSansArmenian');
  static const TextStyle g16 = TextStyle(
      color: CustomColors.inputGrey,
      fontSize: 16,
      fontFamily: 'NotoSansArmenian');
  static const TextStyle g18b = TextStyle(
      color: CustomColors.inputGrey,
      fontSize: 18,
       fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle g14b = TextStyle(
      color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle b14b = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle r14b = TextStyle(
      color: Colors.red,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle rm16b = TextStyle(
      color: CustomColors.redMain,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle b16 = TextStyle(
      color: Colors.black, fontSize: 16, fontFamily: 'NotoSansArmenian');
  static TextStyle get w16 => TextStyle(
      color: CustomColors.textPrimary, fontSize: 16, fontFamily: 'NotoSansArmenian');

  static const TextStyle g16b = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle b16b = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle t16b = TextStyle(
      color: CustomColors.blue,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static TextStyle get w16b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static const TextStyle b18b = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static TextStyle get w18b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static const TextStyle b20b = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static TextStyle get w20b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get g22b => TextStyle(
      color: CustomColors.textGrey,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle b22b = TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get w22b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get w26b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');



  static TextStyle get g24b => TextStyle(
      color: CustomColors.textGrey,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle b34b = TextStyle(
      color: Colors.black,
      fontSize: 34,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get w34b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 34,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

    static const TextStyle b38b = TextStyle(
      color: Colors.black,
      fontSize: 38,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get w38b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 38,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');


   static const TextStyle b44b = TextStyle(
      color: Colors.black,
      fontSize: 44,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static TextStyle get w44b => TextStyle(
      color: CustomColors.textPrimary,
      fontSize: 44,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');

  static const TextStyle b56 = TextStyle(
      color: Colors.black, fontSize: 56, fontFamily: 'NotoSansArmenian');
  static TextStyle get w56 => TextStyle(
      color: CustomColors.textPrimary, fontSize: 56, fontFamily: 'NotoSansArmenian');
  static const TextStyle c22b = TextStyle(
      color: CustomColors.cyan,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoSansArmenian');
  static const TextStyle cUnder = TextStyle(
    fontSize: 14,
    color: CustomColors.cyan,
    decorationColor: CustomColors.cyan,
    decoration: TextDecoration.underline,
    decorationThickness: 2.0,
    height: 2.0,
  );
  static const TextStyle c16b = TextStyle(
    fontSize: 16,
    color: CustomColors.cyan,
    fontWeight: FontWeight.bold,
  );
}
