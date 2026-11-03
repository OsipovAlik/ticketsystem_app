import 'package:flutter/material.dart';

import 'custom_colors.dart';

abstract class MyBoxDecoration {
  static BoxDecoration filterBtn = BoxDecoration(
      color: CustomColors.blueLight, borderRadius: BorderRadius.circular(8.0));

  static BoxDecoration inputBox = BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    color: CustomColors.inputBlue.withOpacity(0.6),
    border: Border.all(color: CustomColors.blueBold),
  );
  static BoxDecoration searchBox = BoxDecoration(
    // border: Border.all(width: 2, color: Colors.white),
    borderRadius: BorderRadius.circular(22),
  );
  static BoxDecoration castWidth1 = BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan, // Border color
      width: 1.0, // Border width
    ),
    borderRadius: BorderRadius.circular(100), // Border radius
  );
  static BoxDecoration castWidth2 = BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan, // Border color
      width: 6.0, // Border width
    ),
    borderRadius: BorderRadius.circular(100), // Border radius
  );
  static BoxDecoration ticketButton = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.purple,
        const Color.fromARGB(255, 35, 66, 204),
        // Colors.purple,
      ],
    ),
    borderRadius: BorderRadius.circular(22), // Rounded corners
  );
  static BoxDecoration loadCard = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(12.0),
  );
  static BoxDecoration link = BoxDecoration(
    color: CustomColors.blueBold.withOpacity(0.5),
    borderRadius: BorderRadius.circular(100.0),
  );
  static BoxDecoration ticketCard = BoxDecoration(
      color: CustomColors.blueLight, borderRadius: BorderRadius.circular(8.0));
  static BoxDecoration ticketCyanCard = BoxDecoration(
      color: CustomColors.cyan, borderRadius: BorderRadius.circular(8.0));
  static BoxDecoration languageBox = BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(8.0), // 100% radius
  );
  static BoxDecoration pastBox = BoxDecoration(
    border: Border.all(
      color: CustomColors.cyan,
      width: 2,
    )
  );

  static BoxDecoration boxAppBar = BoxDecoration(
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
  static BoxDecoration bottomModal = BoxDecoration(
    color: CustomColors.blueBold,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(18.0),
    ),
  );
}
