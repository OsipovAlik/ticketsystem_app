import 'package:flutter/material.dart';

import 'custom_colors.dart';

/// All members are getters (not one-shot static fields) so they stay
/// reactive to theme changes — Dart only evaluates a plain `static X x = ...`
/// initializer once per isolate, which would otherwise freeze these at
/// whichever theme was active on first use.
abstract class MyBoxDecoration {
  static BoxDecoration get filterBtn => BoxDecoration(
      color: CustomColors.blueLight, borderRadius: BorderRadius.circular(8.0));

  static BoxDecoration get inputBox => BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    color: CustomColors.inputBlue.withOpacity(0.6),
    border: Border.all(color: CustomColors.blueBold),
  );
  static BoxDecoration get searchBox => BoxDecoration(
    // border: Border.all(width: 2, color: Colors.white),
    borderRadius: BorderRadius.circular(22),
  );
  static BoxDecoration get castWidth1 => BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan, // Border color
      width: 1.0, // Border width
    ),
    borderRadius: BorderRadius.circular(100), // Border radius
  );
  static BoxDecoration get castWidth2 => BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan, // Border color
      width: 6.0, // Border width
    ),
    borderRadius: BorderRadius.circular(100), // Border radius
  );
  static BoxDecoration get ticketButton => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.purple,
        const Color.fromARGB(255, 35, 66, 204),
        // Colors.purple,
      ],
    ),
    borderRadius: BorderRadius.circular(22), // Rounded corners
  );
  static BoxDecoration get loadCard => BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(12.0),
  );
  /// Floating icon badge drawn over arbitrary photo content (event poster
  /// app bar back/favorite buttons) — intentionally theme-invariant (always
  /// a dark scrim + white icon), since it sits on the image, not on the
  /// app's own themed surfaces.
  static BoxDecoration get link => BoxDecoration(
    color: const Color.fromARGB(255, 0, 18, 50).withOpacity(0.5),
    borderRadius: BorderRadius.circular(100.0),
  );
  static BoxDecoration get ticketCard => BoxDecoration(
      color: CustomColors.blueLight, borderRadius: BorderRadius.circular(8.0));
  static BoxDecoration get ticketCyanCard => BoxDecoration(
      color: CustomColors.cyan, borderRadius: BorderRadius.circular(8.0));
  static BoxDecoration get languageBox => BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8.0), // 100% radius
  );
  static BoxDecoration get pastBox => BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan,
      width: 2,
    )
  );

  static BoxDecoration get boxAppBar => BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );
  static BoxDecoration get bottomModal => BoxDecoration(
    color: CustomColors.blueBold,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(18.0),
    ),
  );
}
